//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit

protocol DelegatReturnTables: AnyObject {
    func returnTableReviews(index: Int, street: Street)
    func openImages(images: String?)
}

class TableViewCell: UITableViewCell {
    private var stackViewOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = ColorUIColor.white
        stackView.spacing = NumberCGFloat.zero
        stackView.contentMode = .scaleToFill
        stackView.semanticContentAttribute = .unspecified
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = NumberCGFloat.twenty
        stackView.layer.shadowColor = ColorCGColor.grey
        return stackView
    }()

    private let stackViewTwo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = ColorUIColor.white
        stackView.spacing = NumberCGFloat.zero
        stackView.contentMode = .scaleToFill
        stackView.semanticContentAttribute = .unspecified
        stackView.layoutMargins = UIEdgeInsets(top: NumberCGFloat.fiftiny, left: NumberCGFloat.fiftiny, bottom: NumberCGFloat.fiftiny, right: NumberCGFloat.fiftiny)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.masksToBounds = false
        stackView.layer.shadowOffset = CGSize(width: NumberCGFloat.zero, height: NumberCGFloat.five)
        stackView.layer.shadowOpacity = NumberFloat.zeroThree
        stackView.layer.shadowRadius = NumberCGFloat.six
        stackView.layer.cornerRadius = NumberCGFloat.twenty
        return stackView
    }()

    private let stackViewTree: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = ColorUIColor.greyOne
        stackView.spacing = NumberCGFloat.zero
        stackView.contentMode = .scaleToFill
        stackView.semanticContentAttribute = .unspecified
        stackView.layoutMargins = UIEdgeInsets(top: NumberCGFloat.two, left: NumberCGFloat.ten, bottom: NumberCGFloat.five, right: NumberCGFloat.zero)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.masksToBounds = false
        stackView.layer.cornerRadius = NumberCGFloat.twenty
        stackView.layer.borderColor = ColorCGColor.white
        stackView.layer.borderWidth = NumberCGFloat.one
        return stackView
    }()

    private let stackViewFour: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = NumberCGFloat.zero
        stackView.contentMode = .scaleToFill
        stackView.semanticContentAttribute = .unspecified
        stackView.layer.cornerRadius = NumberCGFloat.twenty
        stackView.backgroundColor = ColorUIColor.greyOne
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var stackViewFive: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = NumberCGFloat.zero
        stackView.contentMode = .scaleToFill
        stackView.semanticContentAttribute = .unspecified
        stackView.layoutMargins = UIEdgeInsets(top: NumberCGFloat.zero, left: NumberCGFloat.zero, bottom: NumberCGFloat.ten, right: NumberCGFloat.ten)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let stackViewFourOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = ColorUIColor.blackWhite
        stackView.spacing = NumberCGFloat.zero
        stackView.layer.cornerRadius = NumberCGFloat.twenty
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var oneIsStreet: Street!
    var indexStreet: Int!
    var arrayNameImages: [String] = []
    weak var delegate: DelegatReturnTables?

    let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = ColorUIColor.greyOne
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: TitleCell.collectionCell)
        return collectionView
    }()

    private let buttonAddPhoto: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: NumberCGFloat.twentyTwo, weight: .regular, scale: .large)
        let image = UIImage(systemName: ImageCustomTitle.plusCircle, withConfiguration: largeConfig)
        button.setImage(image, for: .normal)
        button.tintColor = ColorUIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addConstraints([NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .width, multiplier: NumberCGFloat.one, constant: NumberCGFloat.zero)])
        return button
    }()

    let textFieldMain: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = NumberCGFloat.twenty
        textField.textColor = ColorUIColor.greyTwo
        textField.font = UIFont(name: FontsTitle.arial, size: NumberCGFloat.twentyOne)
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        textFieldMain.delegate = self
    }

    @objc func editingTextFielAct(_ sender: UITextField) {
        if sender.text?.count ?? NumberInt.zero >= NumberInt.one, let text = sender.text {
            oneIsStreet.ref?.updateChildValues([Constants.lableKey: text])
        }
    }

    @objc func addNewPhoto(_: UIButton) {
        delegate?.returnTableReviews(index: indexStreet, street: oneIsStreet)
    }

    func initialize() {
        textFieldMain.addTarget(self, action: #selector(editingTextFielAct(_:)), for: .editingDidEnd)
        buttonAddPhoto.addTarget(self, action: #selector(addNewPhoto(_:)), for: .touchUpInside)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self

        contentView.backgroundColor = ColorUIColor.greyThree
        contentView.addSubview(stackViewOne)
        stackViewOne.addArrangedSubview(stackViewTwo)
        stackViewTwo.addArrangedSubview(stackViewTree)
        stackViewTree.addArrangedSubview(stackViewFour)
        stackViewFour.addArrangedSubview(textFieldMain)
        stackViewFour.addArrangedSubview(stackViewFourOne)
        stackViewFourOne.addArrangedSubview(buttonAddPhoto)
        stackViewTree.addArrangedSubview(stackViewFive)
        stackViewFive.addArrangedSubview(collectionView)
        NSLayoutConstraint.activate([
            stackViewOne.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackViewOne.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackViewOne.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackViewOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: NumberCGFloat.twentyFiveMinus),
            stackViewFive.heightAnchor.constraint(equalToConstant: 130), // height all block
            stackViewFour.heightAnchor.constraint(equalToConstant: 45),

            buttonAddPhoto.rightAnchor.constraint(equalTo: stackViewFourOne.rightAnchor),
            buttonAddPhoto.leftAnchor.constraint(equalTo: stackViewFourOne.leftAnchor),
            buttonAddPhoto.bottomAnchor.constraint(equalTo: stackViewFourOne.bottomAnchor),
            buttonAddPhoto.topAnchor.constraint(equalTo: stackViewFourOne.topAnchor),

            collectionView.topAnchor.constraint(equalTo: stackViewFive.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: stackViewFive.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: stackViewFive.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: stackViewFive.rightAnchor, constant: NumberCGFloat.tenMinus),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
