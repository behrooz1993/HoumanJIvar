//
//  FontProvider.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import UIKit

class FontProvider:NSObject {
    
    static let shared:FontProvider = {
        let _instance = FontProvider()
        return _instance
    }()
    
    let FONT_NAME = "IRANSansMobile"
    
    func getFont(size:CGFloat) -> UIFont {
        if let font = UIFont(name: FONT_NAME, size: size) {
            return font
        }else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
}
