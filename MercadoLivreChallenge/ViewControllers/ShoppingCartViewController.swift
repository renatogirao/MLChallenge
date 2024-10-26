////
////  ShoppingCartViewController.swift
////  MercadoLivreChallenge
////
////  Created by Renato Savoia Girão on 25/10/24.
////
//
import UIKit
//
class ShoppingCartViewController: UIViewController {
//
//    private var collectionView: UICollectionView!
//    private var cartItems: [Product] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Carrinho de Compras"
//
//        setupCollectionView()
//        setupLayout()
//    }
//
//    private func setupCollectionView() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(ProductCarouselCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCarouselCollectionViewCell")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(collectionView)
//    }
//
//    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    func updateCartItems(with items: [Product]) {
//        self.cartItems = items
//        collectionView.reloadData()
//    }
//}
//
//// MARK: - UICollectionViewDataSource
//extension ShoppingCartViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cartItems.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCarouselCollectionViewCell", for: indexPath) as? ProductCarouselCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        let product = cartItems[indexPath.item]
//        let viewModel = ProductCarouselViewModel(product: product)
//        cell.configure(with: viewModel)
//
//        return cell
//    }
//}
//
//// MARK: - UICollectionViewDelegateFlowLayout
//extension ShoppingCartViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 200) // Ajuste conforme necessário
//    }
//}
//
//// MARK: - UICollectionViewDelegate
//extension ShoppingCartViewController: UICollectionViewDelegate {
//
}
//
