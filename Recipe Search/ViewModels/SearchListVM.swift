//
//  SearchListVM.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import UIKit
typealias SLM = SearchListVM
class SearchListVM {
    let q : String?
    let from: Int?
    let to: Int?
    let more: Bool?
    let count: Int?
    var hits: [HitsVM]? = []

    init(list:SearchList?=nil){
        q = list?.q
        from = list?.from
        to = list?.to
        more = list?.more
        count = list?.count
        list?.hits?.forEach({ item in
            hits?.append(HitsVM(hits: item))
        })
        
    }
   
   
    func searchTheRecipe(url: String,completion : @escaping (SearchListVM?,Int?) -> (),failure:@escaping (Error?)->Void){
        APIServices.getRecipeSearchResultList(url: encodeURLString(decodedString: url), completion: { result,statusCode in
            
            DispatchQueue.main.async {
                
                completion(SearchListVM(list: result ),statusCode)

            }
               }, failure: { error in
                
                completion(nil, 500)
                   
               })
    }
    
    func encodeURLString(decodedString:String)->String{
        let unicodeEncodedString = decodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return unicodeEncodedString
    }
 
}



class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener :Listener?
    
    func bind(listener :Listener?) {
        self.listener = listener
        listener?(value!)
    }
    
    var value :T? {
        didSet {
            listener?(value!)
        }
    }
    
    init(_ v:T) {
        value = v
    }
    
}
