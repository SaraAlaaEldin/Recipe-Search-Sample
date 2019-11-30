//
//  EnrekCal.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import SwiftyJSON

class ENERCKCAL {

    let label: String?
    let quantity: Double?
    let unit: String?

    init(_ json: JSON) {
        label = json["label"].stringValue
        quantity = json["quantity"].doubleValue
        unit = json["unit"].stringValue
    }

}
