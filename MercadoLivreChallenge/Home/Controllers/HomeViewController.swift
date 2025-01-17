//
//  HomeViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView!
    private var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeView()
        setupSearchBar()
        homeViewModel.productsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.homeView.collectionView.reloadData()
            }
        }
        homeViewModel.errorOccurred = { error in
            print("Error fetching categories: \(error)")
        }
        fetchProducts()
    }
    
    private func setupHomeView() {
        homeView = HomeView()
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
        homeView.collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    private func fetchProducts() {
        homeViewModel.fetchAllCategories()
    }
    
    private func setupSearchBar() {
        homeView.searchBar.delegate = self
    }
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfCategories()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let category = homeViewModel.category(at: indexPath.item)
        
        homeViewModel.categoryDetail(for: category) { result in
            switch result {
            case .success(let categoryDetail):
                DispatchQueue.main.async {
                    cell.configure(with: category, imageUrl: categoryDetail.picture) 
                }
            case .failure(let error):
                print("Error fetching category detail: \(error)")
            }
        }
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.48, height: collectionView.frame.height * 0.35)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        
        let listProductsVC = ListProductsViewController()
        listProductsVC.viewModel.searchProducts(with: searchText)
        
        navigationController?.pushViewController(listProductsVC, animated: true)
        
        searchBar.resignFirstResponder()
    }
}
