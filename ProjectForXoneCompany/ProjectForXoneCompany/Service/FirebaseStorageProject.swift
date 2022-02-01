//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import Firebase
import UIKit

struct FirebaseStorageProject {
    static let storeUrl = "gs://projectforxonecompany.appspot.com"
    static var storage: Storage {
        var storage = Storage.storage()
        storage = Storage.storage(url: storeUrl)
        return storage
    }
    static let storageRef = FirebaseStorageProject.storage.reference()
}


