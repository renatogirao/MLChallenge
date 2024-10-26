//
//  ListProductsView.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

import UIKit
import Kingfisher

class ListProductsCarouselCollectionView: UIView {
    
    // MARK: - UI Components
    let searchBar = UISearchBar()
    let cartButton = UIButton(type: .system)
    let previewView = UIView()
    let previewImageView = UIImageView()
    let previewTitleLabel = UILabel()
    let previewPriceLabel = UILabel()
    let collectionView: UICollectionView
    
    var products: [Product] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: frame)
        
        setupSearchBar()
        setupCartButton()
        setupPreviewView()
        setupCollectionView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupSearchBar() {
        searchBar.placeholder = "Search for products"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
    }
    
    private func setupCartButton() {
        let cartIcon = UIImage(systemName: "cart")
        cartButton.setImage(cartIcon, for: .normal)
        cartButton.tintColor = .black
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cartButton)
    }
    
    private func setupPreviewView() {
        previewView.backgroundColor = .lightGray
        previewView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(previewView)
        
        previewImageView.contentMode = .scaleAspectFit
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        previewView.addSubview(previewImageView)
        
        previewTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        previewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        previewView.addSubview(previewTitleLabel)
        
        previewPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        previewPriceLabel.textColor = .systemYellow
        previewPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        previewView.addSubview(previewPriceLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(previewTapped))
        previewView.addGestureRecognizer(tapGesture)
        previewView.isUserInteractionEnabled = true
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
//        collectionView.register(ProductCarouselCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCarouselCollectionViewCell")
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -8),
            
            cartButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            cartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cartButton.widthAnchor.constraint(equalToConstant: 30),
            cartButton.heightAnchor.constraint(equalToConstant: 30),
            
            previewView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            previewView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            previewView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            previewView.heightAnchor.constraint(equalToConstant: 200),
            
            previewImageView.topAnchor.constraint(equalTo: previewView.topAnchor, constant: 10),
            previewImageView.leadingAnchor.constraint(equalTo: previewView.leadingAnchor, constant: 10),
            previewImageView.widthAnchor.constraint(equalToConstant: 100),
            previewImageView.heightAnchor.constraint(equalToConstant: 100),
            
            previewTitleLabel.topAnchor.constraint(equalTo: previewImageView.topAnchor),
            previewTitleLabel.leadingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: 10),
            previewTitleLabel.trailingAnchor.constraint(equalTo: previewView.trailingAnchor, constant: -10),
            
            previewPriceLabel.topAnchor.constraint(equalTo: previewTitleLabel.bottomAnchor, constant: 8),
            previewPriceLabel.leadingAnchor.constraint(equalTo: previewTitleLabel.leadingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: previewView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Preview Update Method
    private func updatePreview(with viewModel: ProductCarouselViewModel) {
        previewTitleLabel.text = viewModel.title
        previewPriceLabel.text = viewModel.price
        if let imageURL = viewModel.thumbnailURL {
            previewImageView.kf.setImage(with: imageURL)
        }
    }
    
    // MARK: - Preview Tap Action
    @objc private func previewTapped() {
        print("Produto selecionado na pré-visualização")
    }
}

// MARK: - UICollectionViewDataSource
extension ListProductsCarouselCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCarouselCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Unable to dequeue ProductCarouselCollectionViewCell")
        }
        
        let product = products[indexPath.item]
        let productViewModel = ProductCarouselViewModel(product: product)
//        cell.configure(with: productViewModel)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ListProductsCarouselCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.item]
        let selectedViewModel = ProductCarouselViewModel(product: selectedProduct)
        updatePreview(with: selectedViewModel)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListProductsCarouselCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: 120)
    }
}
