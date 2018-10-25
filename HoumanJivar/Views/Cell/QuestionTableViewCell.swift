//
//  QuestionTableViewCell.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class QuestionTableViewCell: UITableViewCell {

    private var disposeBag = DisposeBag()
    
    var questionLable:UILabel!
    var firstAnswerView:UIView!
    var firstAnswerLabel:UILabel!
    var firstCollectionView:UICollectionView!
    var secondAnswerView:UIView!
    var secondAnswerLabel:UILabel!
    var secondCollectionView:UICollectionView!
    
    var viewModel: QuestionTableViewModelType? {
        willSet {
            disposeBag = DisposeBag()
        }
        didSet {
            setupBindings()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.questionLable = UILabel()
        self.questionLable.font = FontProvider.shared.getFont(size: 14)
        self.questionLable.textAlignment = .right
        contentView.addSubview(self.questionLable)
        self.questionLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(20)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.height.equalTo(22)
        }
        
        self.firstAnswerView = UIView()
        self.firstAnswerView.backgroundColor = .red
        self.contentView.addSubview(self.firstAnswerView)
        self.firstAnswerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.questionLable).offset(30)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.height.equalTo(100)
        }
        
        self.firstAnswerLabel = UILabel()
        self.firstAnswerLabel.font = FontProvider.shared.getFont(size: 14)
        self.firstAnswerLabel.textAlignment = .right
        self.firstAnswerView.addSubview(self.firstAnswerLabel)
        self.firstAnswerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.firstAnswerView).offset(8)
            make.left.equalTo(self.firstAnswerView).offset(20)
            make.right.equalTo(self.firstAnswerView).offset(-20)
            make.height.equalTo(22)
        }
        
        let firstFlowLayout = UICollectionViewFlowLayout()
        firstFlowLayout.scrollDirection = .horizontal
        self.firstCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: firstFlowLayout)
        self.firstCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.firstAnswerView.addSubview(self.firstCollectionView)
        self.firstCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.firstAnswerLabel).offset(20)
            make.left.equalTo(self.firstAnswerView).offset(8)
            make.right.equalTo(self.firstAnswerView).offset(-8)
            make.bottom.equalTo(self.firstAnswerView).offset(-8)
        }
        
        self.secondAnswerView = UIView()
        self.secondAnswerView.backgroundColor = .blue
        self.contentView.addSubview(self.secondAnswerView)
        self.secondAnswerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.firstAnswerView).offset(110)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.bottom.equalTo(self.contentView).offset(-20)
            make.height.equalTo(100)
        }
        
        self.secondAnswerLabel = UILabel()
        self.secondAnswerLabel.font = FontProvider.shared.getFont(size: 14)
        self.secondAnswerLabel.textAlignment = .right
        self.secondAnswerView.addSubview(self.secondAnswerLabel)
        self.secondAnswerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.secondAnswerView).offset(20)
            make.left.equalTo(self.secondAnswerView).offset(20)
            make.right.equalTo(self.secondAnswerView).offset(-20)
            make.height.equalTo(22)
        }
        
        let secondFlowLayout = UICollectionViewFlowLayout()
        secondFlowLayout.scrollDirection = .horizontal
        self.secondCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: secondFlowLayout)
        self.secondCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.secondAnswerView.addSubview(self.secondCollectionView)
        self.secondCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.secondAnswerLabel).offset(20)
            make.left.equalTo(self.secondAnswerView).offset(8)
            make.right.equalTo(self.secondAnswerView).offset(-8)
            make.bottom.equalTo(self.secondAnswerView).offset(-8)
        }
    }
    
    func setupBindings() {
        guard let viewModel = viewModel else { return }
        viewModel.questionText.bind(to: self.questionLable.rx.text).disposed(by: self.disposeBag)
        viewModel.firstAnswerText.bind(to: self.firstAnswerLabel.rx.text).disposed(by: self.disposeBag)
        viewModel.secondAnswerText.bind(to: self.secondAnswerLabel.rx.text).disposed(by: self.disposeBag)
    }

}
