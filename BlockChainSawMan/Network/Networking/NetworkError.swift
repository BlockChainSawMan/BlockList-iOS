//
//  NetworkError.swift
//  ConnectDog
//
//  Created by 정태우 on 10/14/24.
//

import Foundation

enum NetworkError: Error {
    case invalid
    case clientError(ErrorDTO)
}
