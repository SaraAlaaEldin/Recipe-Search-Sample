//
//  SuggestionListSource.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/29/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation


class SuggestionListSource{
        
      private var item_ :String! = ""
         var item : String {
             set { item_ = newValue  }
             get {  return item_ }
         }
    
    init(itemSugg:String) {
        item = itemSugg
    }
    
 
}
