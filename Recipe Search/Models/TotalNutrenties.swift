//
//  TotalNutrenties.swift
//  Recipe Search
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import Foundation
import SwiftyJSON

class TotalNutrients {

    let eNERCKCAL: ENERCKCAL?
    let FAT: ENERCKCAL?
    let FASAT: ENERCKCAL?
    let FATRN: ENERCKCAL?
    let FAMS: ENERCKCAL?
    let FAPU: ENERCKCAL?
    let CHOCDF: ENERCKCAL?
    let FIBTG: ENERCKCAL?
    let SUGAR: ENERCKCAL?
    let PROCNT: ENERCKCAL?
    let CHOLE: ENERCKCAL?
    let NA: ENERCKCAL?
    let CA: ENERCKCAL?
    let MG: ENERCKCAL?
    let K: ENERCKCAL?
    let FE: ENERCKCAL?
    let ZN: ENERCKCAL?
    let P: ENERCKCAL?
    let VITARAE: ENERCKCAL?
    let VITC: ENERCKCAL?
    let THIA: ENERCKCAL?
    let RIBF: ENERCKCAL?
    let NIA: ENERCKCAL?
    let VITB6A: ENERCKCAL?
    let FOLDFE: ENERCKCAL?
    let FOLFD: ENERCKCAL?
    let VITB12: ENERCKCAL?
    let VITD: ENERCKCAL?
    let TOCPHA: ENERCKCAL?
    let VITK1: ENERCKCAL?
    let WATER: ENERCKCAL?

    init(_ json: JSON) {
        eNERCKCAL = ENERCKCAL(json["ENERC_KCAL"])
        FAT = ENERCKCAL(json["FAT"])
        FASAT = ENERCKCAL(json["FASAT"])
        FATRN = ENERCKCAL(json["FATRN"])
        FAMS = ENERCKCAL(json["FAMS"])
        FAPU = ENERCKCAL(json["FAPU"])
        CHOCDF = ENERCKCAL(json["CHOCDF"])
        FIBTG = ENERCKCAL(json["FIBTG"])
        SUGAR = ENERCKCAL(json["SUGAR"])
        PROCNT = ENERCKCAL(json["PROCNT"])
        CHOLE = ENERCKCAL(json["CHOLE"])
        NA = ENERCKCAL(json["NA"])
        CA = ENERCKCAL(json["CA"])
        MG = ENERCKCAL(json["MG"])
        K = ENERCKCAL(json["K"])
        FE = ENERCKCAL(json["FE"])
        ZN = ENERCKCAL(json["ZN"])
        P = ENERCKCAL(json["P"])
        VITARAE = ENERCKCAL(json["VITA_RAE"])
        VITC = ENERCKCAL(json["VITC"])
        THIA = ENERCKCAL(json["THIA"])
        RIBF = ENERCKCAL(json["RIBF"])
        NIA = ENERCKCAL(json["NIA"])
        VITB6A = ENERCKCAL(json["VITB6A"])
        FOLDFE = ENERCKCAL(json["FOLDFE"])
        FOLFD = ENERCKCAL(json["FOLFD"])
        VITB12 = ENERCKCAL(json["VITB12"])
        VITD = ENERCKCAL(json["VITD"])
        TOCPHA = ENERCKCAL(json["TOCPHA"])
        VITK1 = ENERCKCAL(json["VITK1"])
        WATER = ENERCKCAL(json["WATER"])
    }

}
