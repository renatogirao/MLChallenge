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
    
    private func setupViewModelBindings() {
        viewModel.productsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.listProductsView.products = self?.viewModel.products ?? []
            }
        }
        
        viewModel.errorOccurred = { error in
            print("Error fetching products: \(error)")
        }
    }
}

// MARK: - UISearchBarDelegate
extension ListProductsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            viewModel.searchProducts(with: searchText)
            searchBar.resignFirstResponder() 
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ListProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
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
        return CGSize(width: collectionView.frame.width * 0.9, height: 200)
    }
}
