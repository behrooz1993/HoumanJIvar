//
//  ItemViewModel.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import RxSwift

protocol QuestionTableViewModelType {
    var questionText: Observable<String> { get }
    var firstAnswerText: Observable<String> { get }
    var secondAnswerText: Observable<String> { get }
}

class QuestionViewModel: QuestionTableViewModelType {

    var questionText: Observable<String>
    var firstAnswerText: Observable<String>
    var secondAnswerText: Observable<String>
    
    init(question:Question) {
        questionText = .just(question.question ?? "no question")
        firstAnswerText = .just(question.data?.answer?.a1 ?? "no answer")
        secondAnswerText = .just(question.data?.answer?.a2 ?? "no answer")
        
    }
    
}
