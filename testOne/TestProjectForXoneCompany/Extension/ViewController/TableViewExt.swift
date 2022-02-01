//
//  TableViewExt.swift
//  TestProjectForXoneCompany
//
//  Created by sleman on 29.11.21.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayStreet.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.tableCell, for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.indexStreet = indexPath.row
        let street = arrayStreet[indexPath.row]
        cell.oneIsStreet = street
        cell.textFieldMain.placeholder = street.lable
        if street.arrayImage.count >= NumberInt.one {
            cell.stackViewFive.isHidden = false
            cell.collectionView.reloadData()
        } else {
            cell.stackViewFive.isHidden = true
            cell.collectionView.reloadData()
        }
        return cell
    }
}
