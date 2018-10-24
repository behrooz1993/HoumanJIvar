//
//  Api.swift
//  HoumanJivar
//
//  Created by Behrooz Payoon on 10/24/18.
//  Copyright © 2018 Popupak. All rights reserved.
//

import Foundation
import Moya

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

enum TestApi {
    case json
}

extension TestApi: TargetType {
    var baseURL: URL { return URL(string: ApiConstants.BASE_URL)!  }
    var path: String {
        switch self {
        case .json:
            return ApiConstants.JSON_API
        }
    }
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self {
        case .json:
            return .requestPlain
        }
    }
    var validationType: ValidationType {
        switch self{
        case .json:
            return .successCodes
        }
    }
    var sampleData: Data {
        switch self {
        case .json:
            return "{\"id\": 100}".data(using: String.Encoding.utf8)!
        }
    }
    var headers: [String : String]? {
        return nil
    }
}
