//
//  Question.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class Question: Mappable {
    var questionId:Int?
    var questionPubId:Int?
    var surveyId:Int?
    var questionNumber:Int?
    var questionType:String?
    var question:String?
    var data:QuestionData?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        questionId <- map["QuestionId"]
        questionPubId <- map["QuestionPubId"]
        surveyId <- map["SurveyPubId"]
        questionNumber <- map["QuestionNumber"]
        questionType <- map["QuestionType"]
        question <- map["Question"]
        data <- map["Data"]
    }
}
