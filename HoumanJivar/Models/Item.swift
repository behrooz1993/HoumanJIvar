//
//  Item.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class Item: Mappable {
    var code:Int?
    var message:String?
    var questions = [Question]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code <- map["Code"]
        message <- map["Message"]
        questions <- map["Result"]
    }
    
}
