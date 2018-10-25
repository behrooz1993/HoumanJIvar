//
//  MultiMedia.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/25/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import ObjectMapper

class MultiMedia: Mappable {
    var id:Int?
    var title:String?
    var link:String?
    var desc:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["Id"]
        title <- map["Title"]
        link <- map["Link"]
        desc <- map["Description"]
    }
}
