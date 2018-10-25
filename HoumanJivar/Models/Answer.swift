//
//  Answer.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class Answer:Mappable {
    var a1:String?
    var a2:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        a1 <- map["a1"]
        a2 <- map["a2"]
    }
}
