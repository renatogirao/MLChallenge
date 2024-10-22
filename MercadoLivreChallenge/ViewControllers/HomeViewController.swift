//
//  HomeViewController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    var carouselCollectionView: UICollectionView!
     
     var productViewModels: [ProductViewModel] = []
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         title = "Home"
         
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.minimumLineSpacing = 10
         
         carouselCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         carouselCollectionView.delegate = self
         carouselCollectionView.dataSource = self
         carouselCollectionView.showsHorizontalScrollIndicator = false
         carouselCollectionView.backgroundColor = .white
         
         carouselCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
         
         view.addSubview(carouselCollectionView)
         carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 300)
         ])
         fetchProducts()
     }
     
     // MARK: - UICollectionViewDataSource
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return productViewModels.count
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
         let productViewModel = productViewModels[indexPath.item]
         cell.configure(with: productViewModel)
         return cell
     }

     // MARK: - UICollectionViewDelegateFlowLayout
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 250, height: 290)
     }

     // Função para carregar os dados dos produtos (pode ser via API)
     func fetchProducts() {
         // Exemplo de como criar os produtos diretamente (dados de exemplo)
         let products = [
             Product(id: "1", title: "Produto 1", price: 199.99, currencyId: "R$", availableQuantity: 10, condition: "new", permalink: "", thumbnail: "product1_thumbnail", acceptMercadoPago: true, installments: Installments(quantity: 10, amount: 19.99, rate: 0, currencyId: "R$"), shipping: Shipping(freeShipping: true, logisticType: "XD", storePickUp: false), attributes: []),
             Product(id: "2", title: "Produto 2", price: 299.99, currencyId: "R$", availableQuantity: 5, condition: "new", permalink: "", thumbnail: "product2_thumbnail", acceptMercadoPago: true, installments: Installments(quantity: 10, amount: 29.99, rate: 0, currencyId: "R$"), shipping: Shipping(freeShipping: false, logisticType: "XD", storePickUp: false), attributes: [])
         ]
         
         // Transformar a lista de Product em uma lista de ProductViewModel
         self.productViewModels = products.map { ProductViewModel(product: $0) }
         
         // Atualizar a collectionView
         carouselCollectionView.reloadData()
     }
 }
