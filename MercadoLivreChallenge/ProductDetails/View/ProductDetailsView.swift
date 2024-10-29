//
//  ProductView.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit
import Kingfisher

class ProductDetailsView: UIView {
       
    lazy var productImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductImagesCollectionCell.self, forCellWithReuseIdentifier: "ProductImagesCollectionCell")
        collectionView.layer.cornerRadius = 12
        return collectionView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .white
        pageControl.hidesForSinglePage = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = .clear
        return pageControl
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Sem avaliações"
        label.textColor = .orange
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let acceptsMercadoPagoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mercado-pago")
        imageView.tintColor = .green
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let warrantyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar ao carrinho", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let viewModel: ProductDetailsViewModel
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(hex: "0D0F14")
        addSubview(productImageCollectionView)
        addSubview(productNameLabel)
        addSubview(ratingLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(buyNowButton)
        addSubview(acceptsMercadoPagoView)
        addSubview(warrantyLabel)
        addSubview(pageControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            productImageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            productImageCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            pageControl.topAnchor.constraint(equalTo: productImageCollectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: productImageCollectionView.centerXAnchor),
            
            ratingLabel.topAnchor.constraint(equalTo: productImageCollectionView.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            warrantyLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            warrantyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            warrantyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            productNameLabel.topAnchor.constraint(equalTo: warrantyLabel.bottomAnchor, constant: 16),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            descriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            acceptsMercadoPagoView.topAnchor.constraint(equalTo: warrantyLabel.bottomAnchor, constant: 10),
            acceptsMercadoPagoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            acceptsMercadoPagoView.heightAnchor.constraint(equalToConstant: 42),
            acceptsMercadoPagoView.widthAnchor.constraint(equalToConstant: 72),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceLabel.centerYAnchor.constraint(equalTo: buyNowButton.centerYAnchor),
            
            buyNowButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buyNowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buyNowButton.heightAnchor.constraint(equalToConstant: 50),
            buyNowButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure(viewModel: ProductDetailsViewModel) {
        DispatchQueue.main.async {
            self.productNameLabel.text = viewModel.productTitle
            self.ratingLabel.text = viewModel.productRate == "Sem avaliações" ? "Sem avaliações" : "\(viewModel.productRate)"
            self.descriptionLabel.text = viewModel.productDescription
            self.priceLabel.text = viewModel.productPrice
            self.warrantyLabel.text = viewModel.warrantyText ?? "Sem garantia"
            self.acceptsMercadoPagoView.isHidden = !viewModel.acceptsMercadoPago
            
            
            self.pageControl.numberOfPages = viewModel.productImageURLs.count
            self.productImageCollectionView.reloadData()
            self.layoutIfNeeded()
        }
    }
}

extension ProductDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == productDetailsView.productImageCollectionView else { return }
        guard scrollView.frame.width > 0 else { return }
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        productDetailsView.pageControl.currentPage = pageIndex
    }
}
