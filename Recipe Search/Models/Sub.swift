//
//  Sub.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import SwiftyJSON

class Sub {

    let label: String?
    let tag: String?
    let schemaOrgTag: String?
    let total: Double?
    let hasRDI: Bool?
    let daily: Double?
    let unit: String?

    init(_ json: JSON) {
        label = json["label"].stringValue
        tag = json["tag"].stringValue
        schemaOrgTag = json["schemaOrgTag"].stringValue
        total = json["total"].doubleValue
        hasRDI = json["hasRDI"].boolValue
        daily = json["daily"].doubleValue
        unit = json["unit"].stringValue
    }

}
