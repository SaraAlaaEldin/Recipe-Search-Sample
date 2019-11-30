//
//  Recipe.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation

import SwiftyJSON

class Recipe {

    let uri: String?
    let label: String?
    let image: String?
    let source: String?
    let url: String?
    let shareAs: String?
    let yield: Int?
    let dietLabels: [String]?
    let healthLabels: [String]?
    let cautions: [String]?
    let ingredientLines: [String]?
    let ingredients: [Ingredients]?
    let calories: Double?
    let totalWeight: Double?
    let totalTime: Int?
    let totalNutrients: TotalNutrients?
    let totalDaily: TotalNutrients?
    let digest: [Digest]?

    init(_ json: JSON) {
        uri = json["uri"].stringValue
        label = json["label"].stringValue
        image = json["image"].stringValue
        source = json["source"].stringValue
        url = json["url"].stringValue
        shareAs = json["shareAs"].stringValue
        yield = json["yield"].intValue
        dietLabels = json["dietLabels"].arrayValue.map { $0.stringValue }
        healthLabels = json["healthLabels"].arrayValue.map { $0.stringValue }
        cautions = json["cautions"].arrayValue.map { $0.stringValue }
        ingredientLines = json["ingredientLines"].arrayValue.map { $0.stringValue }
        ingredients = json["ingredients"].arrayValue.map { Ingredients($0) }
        calories = json["calories"].doubleValue
        totalWeight = json["totalWeight"].doubleValue
        totalTime = json["totalTime"].intValue
        totalNutrients = TotalNutrients(json["totalNutrients"])
        totalDaily = TotalNutrients(json["totalDaily"])
        digest = json["digest"].arrayValue.map { Digest($0) }
    }
}
