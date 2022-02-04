//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import UIKit

class ConstantsImage {
    static let imageDelete: UIImage? = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .medium)
        let image = UIImage(systemName: "multiply", withConfiguration: largeConfig)
        return image
    }()

    static let imageDeleteEmpty: UIImage? = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .medium)
        let image = UIImage(systemName: "", withConfiguration: largeConfig)
        return image
    }()
}
