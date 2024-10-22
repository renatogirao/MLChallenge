//
//  ProductCarouselCollectionViewCell.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

import UIKit

class ProductCarouselViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGreen
        return label
    }()
    
    private let freeShippingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.text = "Frete Grátis"
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(freeShippingLabel)
    }
    
    func setupView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            freeShippingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            freeShippingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            freeShippingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
        
        
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ProductCarouselViewModel) {
        if let url = viewModel.thumbnailURL {
            imageView.image = url
        }
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        freeShippingLabel.isHidden = !viewModel.hasFreeShipping
    }
}
