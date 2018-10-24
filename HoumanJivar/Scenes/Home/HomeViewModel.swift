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
    var items = BehaviorRelay<[(Item,ItemViewModel)]>(value: [])
    let alert: AnyObserver<String>
    
    // MARK: Outputs
    let alertMessage: Observable<String>
    lazy var itemsData: Observable<[ItemViewModel]> = self.items.asObservable().map({ $0.map{ $0.1} })
    
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
                    let _items = try response.mapArray(Item.self)
                    self.items.accept(_items.map { ($0, ItemViewModel(item: $0)) })
                } catch {
                }
            case let .failure(error):
                self.alert.onNext(error.localizedDescription)
            }
        }
    }

}

