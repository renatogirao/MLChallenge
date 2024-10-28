//
//  ListProductsViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class ListProductsViewController: UIViewController {
    
    private var listProductsView: ListProductsView!
    var viewModel = ListProductsViewModel()
    private var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListProductsView()
        setupViewModelBindings()
    }
    
    private func setupListProductsView() {
        listProductsView = ListProductsView()
        view.addSubview(listProductsView)
        listProductsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listProductsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listProductsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listProductsView.topAnchor.constraint(equalTo: view.topAnchor),
            listProductsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        listProductsView.collectionView.delegate = self
        listProductsView.collectionView.dataSource = self
        listProductsView.collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        listProductsView.searchBar.delegate = self
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.center = view.center
        loadingIndicator.hidesWhenStopped = true
    }
    
    private func setupViewModelBindings() {
        viewModel.productsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.listProductsView.products = self?.viewModel.products ?? []
                self?.listProductsView.hideLoadingIndicator()
            }
        }
        
        viewModel.errorOccurred = { [weak self] error in
            DispatchQueue.main.async {
                self?.showErrorAlert()
                self?.listProductsView.hideLoadingIndicator()
            }
        }
    }

    private func showLoadingIndicator() {
        listProductsView.showLoadingIndicator()
    }
    
    private func showErrorAlert() {
           let alertController = UIAlertController(title: "Erro", message: "Ocorreu um erro ao retornar os produtos", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK :(", style: .default) { [weak self] _ in
               self?.navigationController?.popViewController(animated: true)
           }
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
}

// MARK: - UISearchBarDelegate
extension ListProductsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showLoadingIndicator()
        if let searchText = searchBar.text {
            viewModel.searchProducts(with: searchText)
            searchBar.resignFirstResponder() 
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ListProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfProducts
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = viewModel.product(at: indexPath.row)
        let detailsVC = ProductDetailsViewController(productId: selectedProduct.id)
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            fatalError("Unable to dequeue ProductCollectionViewCell")
        }
        
        let product = viewModel.product(at: indexPath.item)
        cell.configure(with: product)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListProductsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.48, height: collectionView.frame.height * 0.35)
    }
}
