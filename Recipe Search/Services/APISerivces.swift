//
//  ApiSerivces.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON


class APIServices{
    
   static func getRecipeSearchResultList(url:String,completion : @escaping (SearchList, Int) -> (),failure:@escaping (Error?)->Void) {
        
        Alamofire.request(url).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success :
            guard let _ = response.result.value else {
                    failure(response.result.error)
                    return
                }
            let json = JSON(response.result.value as Any)
                    
            let searchList =  SearchList(json)
        
            completion(searchList,response.response?.statusCode ?? 200)

               
             
            case .failure( _):
                    failure(response.result.error)
                
            }
        })
        
    }
    
}
