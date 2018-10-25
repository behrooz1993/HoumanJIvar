//
//  Branching.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class Branching:Mappable {
    var a1:Int?
    var a2:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        a1 <- map["a1"]
        a2 <- map["a2"]
    }
}
