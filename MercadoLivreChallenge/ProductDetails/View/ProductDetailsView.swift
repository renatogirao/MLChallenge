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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Sem avaliações"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let acceptsMercadoPagoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mercado-pago")
        imageView.tintColor = .green
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let warrantyLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 16)
           label.textColor = .lightGray
           label.numberOfLines = 0
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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar ao carrinho", for: .normal)
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
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(hex: "0D0F14")
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(ratingLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(buyNowButton)
        addSubview(acceptsMercadoPagoView)
        addSubview(warrantyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            productImageView.heightAnchor.constraint(equalToConstant: 250),
            
            ratingLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            warrantyLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            warrantyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            warrantyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            productNameLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 16),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            descriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            warrantyLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            warrantyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            warrantyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            acceptsMercadoPagoView.topAnchor.constraint(equalTo: warrantyLabel.bottomAnchor, constant: 10),
            acceptsMercadoPagoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            acceptsMercadoPagoView.heightAnchor.constraint(equalToConstant: 42),
            acceptsMercadoPagoView.widthAnchor.constraint(equalToConstant: 72),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceLabel.centerYAnchor.constraint(equalTo: buyNowButton.centerYAnchor),
            
            buyNowButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buyNowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buyNowButton.heightAnchor.constraint(equalToConstant: 50),
            buyNowButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure() {
        productNameLabel.text = viewModel.productTitle
        ratingLabel.text = viewModel.productRate == "Sem avaliações" ? "Sem avaliações" : "\(viewModel.productRate)"
        descriptionLabel.text = viewModel.productDescription
        priceLabel.text = viewModel.productPrice
        warrantyLabel.text = viewModel.warrantyText ?? "Sem garantia"
        acceptsMercadoPagoView.isHidden = !viewModel.acceptsMercadoPago
        loadImage()
    }
    
    private func loadImage() {
        if let url = viewModel.productImageURL {
            productImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
