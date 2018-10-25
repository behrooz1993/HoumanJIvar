//
//  AnswerFeedbackLogic.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class AnswerFeedback:Mappable {
    var a1:Feedback?
    var a2:Feedback?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        a1 <- map["a1"]
        a2 <- map["a2"]
    }
    
}
