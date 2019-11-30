//
//  RecipeItem.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//


import Foundation
import SwiftyJSON

class Hits {

    let recipe: Recipe?
    let bookmarked: Bool?
    let bought: Bool?

    init(_ json: JSON) {
        recipe = Recipe(json["recipe"])
        bookmarked = json["bookmarked"].boolValue
        bought = json["bought"].boolValue
    }

}
