//
//  CategoryCollectionViewCell.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 25/10/24.
//

import UIKit
import Kingfisher

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let viewCollectionCell: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(viewCollectionCell)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            viewCollectionCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            viewCollectionCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            viewCollectionCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            viewCollectionCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 4),
            viewCollectionCell.heightAnchor.constraint(equalToConstant: 320),
            viewCollectionCell.widthAnchor.constraint(equalToConstant: 300),
            self.heightAnchor.constraint(equalToConstant: 280),
            self.widthAnchor.constraint(equalToConstant: 180),
            
            imageView.topAnchor.constraint(equalTo: viewCollectionCell.topAnchor, constant: 2),
            imageView.leadingAnchor.constraint(equalTo: viewCollectionCell.leadingAnchor,constant: 2),
            imageView.trailingAnchor.constraint(equalTo: viewCollectionCell.trailingAnchor, constant: 2),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
    
    func configure(with category: Category, imageUrl: String) {
        titleLabel.text = category.name
        if let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        }
    }
}
