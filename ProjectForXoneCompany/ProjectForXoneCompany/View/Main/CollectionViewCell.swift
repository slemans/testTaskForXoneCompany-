//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var indexCollectionViewCell: Int!
    var nameCollectionViewCell: String!

    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()

    private let showCaseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = NumberCGFloat.ten
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        //
    }

    private func initialize() {
        contentView.addSubview(showCaseImageView)
        contentView.addSubview(indicator)
        showCaseImageView.frame.contains(CGRect(x: NumberCGFloat.zero, y: NumberCGFloat.zero, width: contentView.frame.size.width, height: contentView.frame.size.width))
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            showCaseImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            showCaseImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            showCaseImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            showCaseImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    public func configure(images: Images?) {
        guard let images = images else { return }
        putImage(image: images.url)
    }

    private func putImage(image: String?) {
        guard let image = image,
              let urlImg = URL(string: image) else { return }
        URLSession.shared.dataTask(with: urlImg) { [weak self] data, _, _ in
            let queue = DispatchQueue.global(qos: .utility)
            queue.sync {
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.sync {
                        self?.showCaseImageView.image = image
                        self?.indicator.stopAnimating()
                    }
                }
            }
        }.resume()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
