import UIKit
class AnimeCell:UITableViewCell{
    private let horizontalStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    private let imageAnimeView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 18
        image.layer.masksToBounds = true
        image.backgroundColor = .blue
        return image
    }()
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .equalCentering
        return stack
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style:style, reuseIdentifier: reuseIdentifier)
    setupContentView()
    addViewsToHierarchy()
    setupConstraints()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    func configure(anime: Anime){
        titleLabel.text = anime.title
        releaseDateLabel.text = "Generos: \(anime.genres)"
    }
    private func setupContentView(){
        selectionStyle = .none
    }
    private func addViewsToHierarchy(){
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(imageAnimeView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(releaseDateLabel)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        NSLayoutConstraint.activate([
            imageAnimeView.widthAnchor.constraint(equalToConstant: 90),
            imageAnimeView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
