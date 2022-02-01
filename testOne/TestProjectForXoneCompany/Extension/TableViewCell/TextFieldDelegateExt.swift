//
//  TextFieldDelegateExt.swift
//  TestProjectForXoneCompany
//
//  Created by sleman on 29.11.21.
//

import UIKit

extension TableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
