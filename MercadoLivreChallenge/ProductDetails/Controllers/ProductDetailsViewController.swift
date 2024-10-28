//
//  ProductDetailsViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    private let viewModel: ProductDetailsViewModel
    private let productDetailsView: ProductDetailsView

    init(productId: String) {
        self.viewModel = ProductDetailsViewModel(productId: productId)
        self.productDetailsView = ProductDetailsView(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(productDetailsView) // Adiciona a view
        setupConstraints() // Configura as restrições
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
    
    private func loadProductDetails() {
        viewModel.fetchProductDetails { [weak self] result in
            switch result {
            case .success():
                DispatchQueue.main.async {
                    self?.productDetailsView.configureView() // Chama o método para configurar a view
                }
            case .failure(let error):
                print("Erro ao carregar os detalhes do produto: \(error)")
            }
        }
    }
}
