//
//  HomeViewModel.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Moya_ObjectMapper

class HomeViewModel {
    
    var testProvider:MoyaProvider<TestApi>!
    
    // MARK: Inputs
    var questions = BehaviorRelay<[(Question,QuestionViewModel)]>(value: [])
    let alert: AnyObserver<String>
    
    // MARK: Outputs
    let alertMessage: Observable<String>
    lazy var questionsData: Observable<[QuestionViewModel]> = self.questions.asObservable().map({ $0.map{ $0.1} })
    
    init(testProvider:MoyaProvider<TestApi>) {
        self.testProvider = testProvider
        
        let _alertMessage = PublishSubject<String>()
        self.alert = _alertMessage.asObserver()
        self.alertMessage = _alertMessage.asObservable()
    }
    
    func loadItems() {
        self.testProvider.request(.json) { (result) in
            switch result {
            case let .success(response):
                do {
                    let item = try response.mapObject(Item.self)
                    let _questions = item.questions
                    self.questions.accept(_questions.map { ($0, QuestionViewModel(question: $0)) })
                } catch {
                }
            case let .failure(error):
                self.alert.onNext(error.localizedDescription)
            }
        }
    }

}

