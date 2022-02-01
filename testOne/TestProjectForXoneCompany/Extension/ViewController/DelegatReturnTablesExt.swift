//
//  DelegatReturnTablesExt.swift
//  TestProjectForXoneCompany
//
//  Created by sleman on 29.11.21.
//

import UIKit

extension ViewController: DelegatReturnTables {
    func openImages(images: String?) {
        performSegue(withIdentifier: SegueTitle.photos, sender: images)
    }
    func returnTableReviews(index: Int, street: Street) {
        cooseImagePicker(source: .photoLibrary)
        indexCellWherePutImages = index
        streetWhyPick = street
    }

}
