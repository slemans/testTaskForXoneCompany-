//
//  CollectionViewExt.swift
//  TestProjectForXoneCompany
//
//  Created by sleman on 29.11.21.
//

import UIKit

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = NumberCGFloat.five * (NumberCGFloat.three + NumberCGFloat.two)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / NumberCGFloat.three
        let height = widthPerItem
        return CGSize(width: widthPerItem, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: NumberCGFloat.five, left: NumberCGFloat.zero, bottom: NumberCGFloat.zero, right: NumberCGFloat.zero)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return NumberCGFloat.five
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return NumberCGFloat.zero
    }
}
