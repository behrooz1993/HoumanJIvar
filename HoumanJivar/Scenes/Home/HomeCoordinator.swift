//
//  HomeCoordinator.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class HomeCoordinator: BaseCoordinator<Void>{
    
    private let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let testProvider = MoyaProvider<TestApi>()
        let viewModel = HomeViewModel(testProvider: testProvider)
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.viewModel = viewModel
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
}
