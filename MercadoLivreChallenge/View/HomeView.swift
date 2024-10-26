//
//  HomeView.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI Components
    
    private let titleHomeLabel: UILabel = {
        let label = UILabel()
        label.text = "O que você quer comprar hoje?"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar produtos"
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .clear
        searchBar.isTranslucent = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.tintColor = .white
        searchBar.layer.borderColor = UIColor.clear.cgColor
        searchBar.layer.backgroundColor = UIColor(hex: "141821")?.cgColor
        searchBar.layer.cornerRadius = 12
        return searchBar
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.cornerRadius = 12
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var productViewModels: [ProductCarouselViewModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(hex: "0D0F14")
        addSubview(searchBar)
        addSubview(collectionView)
        addSubview(titleHomeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleHomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleHomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            titleHomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            searchBar.topAnchor.constraint(equalTo: titleHomeLabel.bottomAnchor, constant: 18),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
