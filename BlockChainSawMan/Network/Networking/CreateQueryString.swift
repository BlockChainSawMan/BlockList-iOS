//
//  CreateQueryString.swift
//  ConnectDog
//
//  Created by 정태우 on 2/20/25.
//

import Foundation

func createQueryString(from parameters: [String: Any?]) -> String {
    var components: [String] = []
    
    for (key, value) in parameters {
        guard let value = value else { continue } // nil 값 무시
        if let array = value as? [String] {
            for item in array {
                components.append("\(key)=\(item)")
            }
        } else {
            components.append("\(key)=\(value)")
        }
    }
    
    return components.joined(separator: "&")
}
