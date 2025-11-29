//
//  PageableDTO.swift
//  ConnectDog
//
//  Created by 정태우 on 2/20/25.
//

import Foundation

struct PageableDTO: Codable {
    let page: Int
    let size: Int
    let sort: String
}
