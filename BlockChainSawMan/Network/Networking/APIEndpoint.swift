//
//  APIEndpoint.swift
//  ConnectDog
//
//  Created by 정태우 on 11/7/24.
//

import Alamofire
import Foundation
import UIKit

struct APIEndpoint<Response: Codable> {
    typealias ResponseDTO = Response
    
    var method: HTTPMethod
    var path: String
    var headerType: APIHeaderType = .withAuth
    var body: [String: Any]?
    
    func request(completion: @escaping (Result<Response?, Error>) -> Void) {
        let url = "https://blocklist.up.railway.app\(path)"
        let headers: HTTPHeaders = headerType.headers
        
        AF
        .request(
            url,
            method: method,
            parameters: body,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate()
        .responseDecodable(of: Response.self) { response in
            switch response.result {
            case .success(let decoded):
                completion(.success(decoded))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func printLog(_ issue: String) {
        NetworkLogger.debugLog(method: method, path: "\(path)", issue: issue)
    }
}
