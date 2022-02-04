//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let padding = NumberCGFloat.five * (NumberCGFloat.three + NumberCGFloat.two)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / NumberCGFloat.three
        let height = widthPerItem
        return CGSize(width: widthPerItem, height: height)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: NumberCGFloat.five, left: NumberCGFloat.zero, bottom: NumberCGFloat.zero, right: NumberCGFloat.zero)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return NumberCGFloat.five
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return NumberCGFloat.zero
    }
}
