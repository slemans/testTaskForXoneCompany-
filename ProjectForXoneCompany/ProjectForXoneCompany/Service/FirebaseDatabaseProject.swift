//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import Firebase
import UIKit

struct FirebaseDatabaseProject {
    static var ref: DatabaseReference{
        let ref = Database.database().reference(withPath: "Streets")
        return ref
    }
}
