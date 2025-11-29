//
//  GraphAPI.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/27/25.
//

import Foundation

struct GraphAPI {
    func postCheckWallet(address: [String]) -> APIEndpoint<PostCheckWalletResponseDTO> {
        let path = "/v1/check_wallet"
        let body: [String: Any] = [
            "txIds": address
        ]
        print("DEBUG: Alamofire request 시작")
        return APIEndpoint(method: .post, path: path, body: body)
    }
}
