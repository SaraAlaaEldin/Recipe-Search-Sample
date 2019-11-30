//
//  RecipeVM.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import UIKit

class RecipeVM {
    
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
    
    init(recipe:Recipe){
        uri = recipe.uri
        label = recipe.label
        image =  recipe.image
        source = recipe.source
        url = recipe.url
        shareAs = recipe.shareAs
        yield = recipe.yield
        dietLabels = recipe.dietLabels
        healthLabels = recipe.healthLabels
        cautions = recipe.cautions
        ingredientLines = recipe.ingredientLines
        ingredients = recipe.ingredients
        calories = recipe.calories
        totalWeight = recipe.totalWeight
        totalTime = recipe.totalTime
        totalNutrients = recipe.totalNutrients
        totalDaily = recipe.totalDaily
        digest = recipe.digest
        
    }
    
  
        
    
}
