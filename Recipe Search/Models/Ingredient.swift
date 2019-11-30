//
//  Ingredient.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ingredients {

    let text: String?
    let weight: Int?

    init(_ json: JSON) {
        text = json["text"].stringValue
        weight = json["weight"].intValue
    }

}
