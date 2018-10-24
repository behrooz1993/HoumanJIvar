//
//  HomeViewController.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController,StoryboardInitializable {

    var viewModel:HomeViewModel!
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Private methods
extension HomeViewController {
    private func initViews() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (tableView) in
            tableView.top.equalTo(self.view)
            tableView.bottom.equalTo(self.view)
            tableView.left.equalTo(self.view)
            tableView.right.equalTo(self.view)
        }
    }
}
