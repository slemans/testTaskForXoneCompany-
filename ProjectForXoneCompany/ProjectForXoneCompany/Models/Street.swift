//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import Firebase
import UIKit

struct Street {
    var lable: String
    let ref: DatabaseReference?
    var arrayImage: [Images?]

    init(lable: String) {
        self.lable = lable
        ref = nil
        arrayImage = []
    }

    init?(snapshot: DataSnapshot) {
        var arrayImageTwo: [Images?] = []
        guard let snapshotValue = snapshot.value as? [String: Any],
              let lable = snapshotValue[Constants.lableKey] as? String
        else { return nil }
        if let favoritedDate = snapshotValue["arrayImage"] as? [String: [String: String]] {
            for (_, value) in favoritedDate {
                var title = ""
                var url = ""
                for (key, date) in value {
                    if key == "title" {
                        title = date
                    } else {
                        url = date
                    }
                }
                arrayImageTwo.append(Images(title: title, url: url))
            }
        }
        self.lable = lable
        ref = snapshot.ref
        arrayImage = arrayImageTwo
    }

    func convertStreetDictionary() -> [String: Any] {
        [Constants.lableKey: lable, Constants.arrayImageKey: []]
    }
}

struct Images: Comparable {
    static func < (lhs: Images, rhs: Images) -> Bool {
        return lhs.title < rhs.title
    }

    let url: String
    let title: String
    var pick: Bool = false

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }

    func convertStreetDictionary() -> [String: Any] {
        [Constants.titleKey: title, Constants.urlKey: url]
    }
}
