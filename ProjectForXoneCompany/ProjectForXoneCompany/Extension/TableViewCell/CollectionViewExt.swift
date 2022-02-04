//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return oneIsStreet.arrayImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.collectionCell, for: indexPath) as! CollectionViewCell
        let sortedArray = oneIsStreet.arrayImage.sorted(by: { ImagesOne, ImagesTwo in
            ImagesOne!.title < ImagesTwo!.title
        })
        let imageStreet = sortedArray[indexPath.row]
        cell.configure(images: imageStreet)
        cell.indexCollectionViewCell = indexPath.row
        cell.nameCollectionViewCell = imageStreet?.title
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = oneIsStreet.arrayImage[indexPath.row]?.url
        delegate?.openImages(images: image)
    }
}
