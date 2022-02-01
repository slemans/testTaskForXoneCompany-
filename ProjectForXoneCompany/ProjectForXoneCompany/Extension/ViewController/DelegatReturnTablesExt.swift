//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
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
