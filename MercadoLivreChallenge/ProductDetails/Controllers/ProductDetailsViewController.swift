//
//  ProductDetailsViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    let viewModel: ProductDetailsViewModel
    let productDetailsView: ProductDetailsView

    init(productId: String, viewModel: ProductDetailsViewModel? = nil, productDetailsView: ProductDetailsView? = nil) {
        self.viewModel = viewModel ?? ProductDetailsViewModel(productId: productId)
        self.productDetailsView = productDetailsView ?? ProductDetailsView(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(productDetailsView)
        setupConstraints()
        loadProductDetails()
        productDetailsView.productImageCollectionView.dataSource = self
        productDetailsView.productImageCollectionView.delegate = self
    }

    private func setupConstraints() {
        productDetailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func loadProductDetails() {
        viewModel.fetchProductDetails { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    if let viewModel = self?.viewModel {
                        self?.productDetailsView.configure(viewModel: viewModel)
                        self?.productDetailsView.productImageCollectionView.reloadData()
                    }
                }
            case .failure(let error):
                print("Erro ao carregar os detalhes do produto: \(error)")
            }
        }
    }
}


// MARK: - UICollectionViewDataSource

extension ProductDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.productImageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImagesCollectionCell", for: indexPath) as! ProductImagesCollectionCell
        let url = viewModel.productImageURLs[indexPath.item]
        cell.configure(with: url)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

