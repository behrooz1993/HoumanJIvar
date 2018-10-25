//
//  HomeViewController.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController,StoryboardInitializable {

    var viewModel:HomeViewModel!
    var disposeBag = DisposeBag()
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
        self.setupBinding()
        self.viewModel.loadItems()
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
        
        self.tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: AppConstants.QUESTION_CELL)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
    }
    
    private func setupBinding() {
        self.viewModel.questionsData
            .bind(to: self.tableView.rx.items) { tableView, index, item in
                let indexPath = IndexPath(row: index, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.QUESTION_CELL, for: indexPath) as! QuestionTableViewCell
                cell.viewModel = item
                cell.selectionStyle = .none
                return cell
            }
            .disposed(by: disposeBag)
        
        self.viewModel.alertMessage
            .subscribe(onNext: { [weak self] in self?.presentAlert(message: $0) })
            .disposed(by: self.disposeBag)
    }
    
    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
