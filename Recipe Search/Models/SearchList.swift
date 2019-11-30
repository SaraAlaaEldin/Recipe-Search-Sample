//
//  SearchList.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import SwiftyJSON


class SearchList {
    let q: String?
    let from: Int?
    let to: Int?
    let more: Bool?
    let count: Int?
    let hits: [Hits]?

    init(_ json: JSON) {
        q = json["q"].stringValue
        from = json["from"].intValue
        to = json["to"].intValue
        more = json["more"].boolValue
        count = json["count"].intValue
        hits = json["hits"].arrayValue.map { Hits($0) }
    }

    
}


