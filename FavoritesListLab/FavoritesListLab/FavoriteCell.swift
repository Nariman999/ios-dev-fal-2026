import UIKit

class FavoriteCell: UITableViewCell {
    
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let starsStackView = UIStackView()
    private var starImageViews: [UIImageView] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Сурет баптаулары
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.contentMode = .scaleAspectFit
        contentView.addSubview(itemImageView)
        
        // Title Label баптаулары
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        
        // Subtitle Label баптаулары
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .secondaryLabel
        contentView.addSubview(subtitleLabel)
        
        // Жұлдыздар Stack View баптаулары
        starsStackView.axis = .horizontal
        starsStackView.alignment = .fill
        starsStackView.distribution = .fillEqually
        starsStackView.spacing = 4
        starsStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starsStackView)
        
        for _ in 0..<5 {
            let star = UIImageView()
            star.contentMode = .scaleAspectFit
            star.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                star.widthAnchor.constraint(equalToConstant: 16),
                star.heightAnchor.constraint(equalToConstant: 16)
            ])
            starsStackView.addArrangedSubview(star)
            starImageViews.append(star)
        }
        
        // Layout Constraints (Орналасуы)
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 50),
            itemImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            starsStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starsStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4)
        ])
    }
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        itemImageView.image = UIImage(systemName: item.imageName)
        itemImageView.tintColor = .systemBlue
        
        for (index, star) in starImageViews.enumerated() {
            if index < item.rating {
                star.image = UIImage(systemName: "star.fill")
                star.tintColor = .systemYellow
            } else {
                star.image = UIImage(systemName: "star")
                star.tintColor = .systemGray4
            }
        }
    }
}
