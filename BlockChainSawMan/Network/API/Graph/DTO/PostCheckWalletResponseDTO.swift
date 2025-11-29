//
//  PostCheckWalletResponseDTO.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/27/25.
//

import Foundation

struct PostCheckWalletResponseDTO: Codable {
    let results: [WalletResult]
}

struct WalletResult: Codable {
    let txId: String
    let riskScore: Double
    let status: String
    let explanation: String
    let explanationSummary: String
    let explanationBullet: [String]
    let evidenceGraph: EvidenceGraph

    enum CodingKeys: String, CodingKey {
        case txId
        case riskScore = "risk_score"
        case status
        case explanation
        case explanationSummary = "explanation_summary"
        case explanationBullet = "explanation_bullet"
        case evidenceGraph = "evidence_graph"
    }
}

struct Node: Codable {
    let id: String
    let classValue: Int
    let entityType: String
    let comment: String

    enum CodingKeys: String, CodingKey {
        case id
        case classValue = "class"
        case entityType = "entity_type"
        case comment
    }
}
