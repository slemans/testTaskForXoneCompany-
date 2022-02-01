//
//  CollectionViewExt.swift
//  TestProjectForXoneCompany
//
//  Created by sleman on 29.11.21.
//

import UIKit

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oneIsStreet.arrayImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.collectionCell, for: indexPath) as! CollectionViewCell
        let imageStreet = oneIsStreet.arrayImage[indexPath.row]
        cell.configure(images: imageStreet)
        cell.indexCollectionViewCell = indexPath.row
        cell.nameCollectionViewCell = imageStreet?.title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = oneIsStreet.arrayImage[indexPath.row]?.url
        delegate?.openImages(images: image)
    }
}
