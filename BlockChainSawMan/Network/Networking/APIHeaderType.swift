//
//  APIHeaderType.swift
//  ConnectDog
//
//  Created by 정태우 on 11/7/24.
//

import Alamofire
import Foundation

enum APIHeaderType {
    case withoutAuth
    case withAuth
    
    var headers: HTTPHeaders {
        switch self {
        case .withoutAuth:
            let result: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            return result
        case .withAuth:
            let result: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            return result
        }
    }
}
