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
    var questionId:Int?
    var questionPubId:Int?
    var surveyId:Int?
    var questionNumber:Int?
    var questionType:String?
    var question:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
     }
}
