//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    let tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = ColorUIColor.greyThree
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TitleCell.tableCell)
        return tableView
    }()
    private let buttonAddCell: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: NumberCGFloat.fiftyFive, weight: .regular, scale: .large)
        let image = UIImage(systemName: ImageCustomTitle.plusCircle, withConfiguration: largeConfig)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addConstraints([NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .width, multiplier: NumberCGFloat.one, constant: NumberCGFloat.zero)])
        button.layer.cornerRadius = NumberCGFloat.twenty
        button.heightAnchor.constraint(equalToConstant: NumberCGFloat.seventy).isActive = true
        button.widthAnchor.constraint(equalToConstant: NumberCGFloat.seventy).isActive = true
        return button
    }()

    private let viewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var arrayStreet: [Street] = []
    var indexCellWherePutImages: Int?
    var streetWhyPick: Street!
//    let store = Storage.storage()

    override func viewDidLoad() {
        super.viewDidLoad()
        startKeyboardObserver()
        startSetting()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseDatabaseProject.ref.observe(.value) { [weak self] snapshot in
            var arrayStreetTwo = [Street]()
            for item in snapshot.children {
                guard let snapshot = item as? DataSnapshot,
                    let street = Street(snapshot: snapshot) else { continue }
                arrayStreetTwo.append(street)
            }
            self?.arrayStreet = arrayStreetTwo
            self?.tableView.reloadData()
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        FirebaseDatabaseProject.ref.removeAllObservers()
    }

    @objc func pressed(_ sender: UIButton) {
        let newStreetTask = Street(lable: "Название локации")
        arrayStreet.append(newStreetTask)
        let newSteet = FirebaseDatabaseProject.ref.child("location\(arrayStreet.count)")
        newSteet.setValue(newStreetTask.convertStreetDictionary())
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ImagesVC = segue.destination as? ImagesViewController {
            ImagesVC.imageUrl = sender as? String
        }
    }

    private func setupTableView() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: viewTop.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupButton() {
        buttonAddCell.rightAnchor.constraint(equalTo: view.rightAnchor, constant: NumberCGFloat.twentyFiveMinus).isActive = true
        buttonAddCell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: NumberCGFloat.fortyMinus).isActive = true
    }

    func setupViewTop() {
        viewTop.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewTop.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewTop.topAnchor.constraint(equalTo: view.topAnchor, constant: NumberCGFloat.thirty).isActive = true
        viewTop.heightAnchor.constraint(equalToConstant: 150).isActive = true
        let imageTop = UIImageView()
        imageTop.image = #imageLiteral(resourceName: "logo")
        imageTop.translatesAutoresizingMaskIntoConstraints = false
        viewTop.addSubview(imageTop)
        imageTop.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor).isActive = true
        imageTop.centerXAnchor.constraint(equalTo: viewTop.centerXAnchor).isActive = true
        let labelTop = UILabel()
        labelTop.text = "ЛОКАЦИИ"
        labelTop.textAlignment = .center
        labelTop.textColor = #colorLiteral(red: 0.1294117647, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
        labelTop.font = UIFont(name: "Oswald-Regular", size: 40)
        
        labelTop.translatesAutoresizingMaskIntoConstraints = false
        viewTop.addSubview(labelTop)
        labelTop.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor).isActive = true
        labelTop.centerXAnchor.constraint(equalTo: viewTop.centerXAnchor).isActive = true
    }
    private func startSetting() {
        buttonAddCell.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        tableView.separatorInset = UIEdgeInsets(top: NumberCGFloat.zero, left: NumberCGFloat.zero, bottom: NumberCGFloat.zero, right: NumberCGFloat.zero)
        tableView.separatorStyle = .none

        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        view.addSubview(viewTop)
        setupViewTop()
        view.addSubview(tableView)
        setupTableView()
        view.addSubview(buttonAddCell)
        setupButton()
    }
}







