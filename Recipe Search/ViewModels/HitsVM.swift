//
//  HitsVM.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation

class HitsVM {

let recipe: RecipeVM?
  let bookmarked: Bool?
  let bought: Bool?
  
    init(hits:Hits){
        recipe =  RecipeVM(recipe: hits.recipe ?? Recipe(""))
        bookmarked = hits.bookmarked
        bought = hits.bought

    }
}


class HitsListVM{
    
    let hitsList:[HitsVM]? = [HitsVM]()
    
   
    
}
