//
//  ProductView.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit
import Kingfisher

class ProductDetailsView: UIView {
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .orange
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
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy Now", for: .normal)
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
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(ratingLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(buyNowButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalToConstant: 250),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            ratingLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            priceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            buyNowButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buyNowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buyNowButton.heightAnchor.constraint(equalToConstant: 50),
            buyNowButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureView() {
        productNameLabel.text = viewModel.productTitle // Substituído para `productTitle`
        ratingLabel.text = viewModel.productRating
        descriptionLabel.text = viewModel.productDescription
        priceLabel.text = viewModel.productPrice
        loadImage()
    }
    
    private func loadImage() {
        if let url = viewModel.productThumbnailURL {
            productImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
