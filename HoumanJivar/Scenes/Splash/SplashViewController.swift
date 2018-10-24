//
//  SplashViewController.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController,StoryboardInitializable {

    var viewModel:SplashViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.viewModel.changeScreen.onCompleted()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
