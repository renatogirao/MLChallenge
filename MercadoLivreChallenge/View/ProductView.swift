import UIKit

class ProductView: UIViewController {
    
    var viewModel: ProductViewModel?
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Comprar Agora", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(productImageView)
        view.addSubview(productTitleLabel)
        view.addSubview(priceLabel)
        view.addSubview(conditionLabel)
        view.addSubview(buyButton)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            productImageView.widthAnchor.constraint(equalToConstant: 200),
            
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            productTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            conditionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            conditionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func bindViewModel() {
        DispatchQueue.main.async { [self] in
            self.productTitleLabel.text = self.viewModel?.productTitle
            self.priceLabel.text = self.viewModel?.productPrice
            self.conditionLabel.text = self.viewModel?.productCondition
            
            if let imageUrl = self.viewModel?.productImageUrl {
                loadImage(from: imageUrl)
            }
        }
    }
    
    private func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.productImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
