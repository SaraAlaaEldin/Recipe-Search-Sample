//
//  Constants.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation

struct URLS {
  static  let appKey = "7cf6d200b97bdb544efca408a2b491ac"
   static let appId = "a0730235"
   static let baseURLSearch = "https://api.edamam.com/search"
  
}


class Constants {
    
    
      static func setSuggList(items:[String]){
        do {
            if #available(iOS 11.0, *) {
                let data =  try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
                UserDefaults.standard.set(data, forKey: "itemSugg")

            } else {
                // Fallback on earlier versions
                let data = NSKeyedArchiver.archivedData(withRootObject:items )
                UserDefaults.standard.set(data, forKey: "itemSugg")

            }

        } catch {
            print("Couldn't write file")
        }

        }
        
      static  func getSuggetionList()->[String]{
        guard let unarchivedObject = UserDefaults.standard.data(forKey: "itemSugg")
         else {
             return []
         }
         do {
             guard let array = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedObject) as? [String] else {
                return []
             }
             return array
         } catch {
            return []

         }
        
    }
}
