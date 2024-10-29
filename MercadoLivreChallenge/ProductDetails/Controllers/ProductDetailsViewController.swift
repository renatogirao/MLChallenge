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
                case .success():
                    DispatchQueue.main.async {
                        self?.updateProductDetailsView()
                        self?.viewModel.getProductRate(itemID: self?.viewModel.productId ?? "")
                    }
                case .failure(let error):
                    print("Erro ao carregar os detalhes do produto: \(error)")
                }
            }
        }
    
    private func updateProductDetailsView() {
        productDetailsView.configure()
      }
}
