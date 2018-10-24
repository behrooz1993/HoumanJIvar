//
//  SplashCoordinator.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class SplashCoordinator: BaseCoordinator<Void> {
    
    private let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController.initFromStoryboard()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
        _ = viewModel.showHomeScreen
            .subscribe(onCompleted:{
                self.showHomeScreen()
            })
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    private func showHomeScreen() {
        let homeCoordinator = HomeCoordinator(window: self.window)
        homeCoordinator.start()
            .subscribe()
            .disposed(by: self.disposeBag)
    }
    
}
