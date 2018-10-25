//
//  MultiMediaViewModel.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import RxSwift

protocol MultiMediaCollectionViewModelType {
    var url: Observable<URL> { get }
}


class MultiMediaViewModel: MultiMediaCollectionViewModelType {
    
    var url: Observable<URL>
    
    init(multiMedia:MultiMedia) {
        let _url = URL(string: multiMedia.link ?? "http://www.harrison.com/img/video/no-video.gif")
        url = .just(_url ?? URL(string: "http://www.harrison.com/img/video/no-video.gif")!)
    }
    
}
