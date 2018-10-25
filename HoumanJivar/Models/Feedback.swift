//
//  QuestionFeedback.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class Feedback: Mappable {
    var feedback:String?
    var multimedia = [MultiMedia]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        feedback <- map["feedback"]
        multimedia <- map["MultiMedia"]
    }
}
