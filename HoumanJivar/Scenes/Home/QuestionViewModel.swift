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
    var firstMultimedia: Observable<[(MultiMedia,MultiMediaViewModel)]> { get }
    var secondMultimedia: Observable<[(MultiMedia,MultiMediaViewModel)]> { get }
}

class QuestionViewModel: QuestionTableViewModelType {

    var questionText: Observable<String>
    var firstAnswerText: Observable<String>
    var secondAnswerText: Observable<String>
    var firstMultimedia: Observable<[(MultiMedia,MultiMediaViewModel)]>
    var secondMultimedia: Observable<[(MultiMedia,MultiMediaViewModel)]>
    
    init(question:Question) {
        questionText = .just(question.question ?? "no question")
        firstAnswerText = .just(question.data?.answer?.a1 ?? "no answer")
        secondAnswerText = .just(question.data?.answer?.a2 ?? "no answer")
        
        firstMultimedia = .just(question.data?.answerFeedback?.a1?.multimedia.map { ($0, MultiMediaViewModel(multiMedia: $0)) } ?? [(MultiMedia,MultiMediaViewModel)]())
        secondMultimedia = .just(question.data?.answerFeedback?.a2?.multimedia.map { ($0, MultiMediaViewModel(multiMedia: $0)) } ?? [(MultiMedia,MultiMediaViewModel)]())
    }
    
}
