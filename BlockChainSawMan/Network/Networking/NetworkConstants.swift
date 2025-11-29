//
//  NetworkConstants.swift
//  ConnectDog
//
//  Created by 정태우 on 11/7/24.
//

import Foundation

struct NetworkConstants {
    static let baseUrl = Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl"
    static let accessToken = "accessToken"
}
