//
//  QuestionData.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class QuestionData:Mappable {
    var isRequired:Bool?
    var questionFeedback:Feedback?
    var answer:Answer?
    var branching:Branching?
    var answerFeedback:AnswerFeedback?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        isRequired <- map["IsRequired"]
        questionFeedback <- map["QuestionFeedback"]
        answer <- map["Answer"]
        branching <- map["Branching"]
        answerFeedback <- map["AnswerFeedbackLogic"]
    }
}
