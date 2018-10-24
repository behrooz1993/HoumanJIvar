//
//  SplashViewModel.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import RxSwift

class SplashViewModel {
    
    let changeScreen: AnyObserver<Void>
    let showHomeScreen: Observable<Void>
    
    init() {
        let _changeScreen = PublishSubject<Void>()
        self.changeScreen = _changeScreen.asObserver()
        self.showHomeScreen = _changeScreen.asObservable()
    }
    
}
