//
//  EvidenceGraph.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/18/25.
//

struct EvidenceGraph: Codable {
    let nodes: [GraphNode]
    let edges: [GraphEdge]
    
    static let dummy = EvidenceGraph(
        nodes: [
            GraphNode(id: "155304581", class: 2, entity_type: "Hacker", comment: "권예인"),
            GraphNode(id: "2232022460", class: 3, entity_type: "Mixer", comment: "정태우"),
            GraphNode(id: "230425980", class: 1, entity_type: "Unclassified", comment: "국준호"),
            GraphNode(id: "340598210", class: 1, entity_type: "Unclassified", comment: "김이정")
        ],
        edges: [
            GraphEdge(
                source: "155304581",
                target: "2232022460",
                importance: 0.0
            ),
            GraphEdge(
                source: "2232022460",
                target: "230425980",
                importance: 0.0
            ),
            GraphEdge(
                source: "230425980",
                target: "340598210",
                importance: 0.0
            )
        ]
    )
}

struct GraphNode: Codable, Hashable, Identifiable {
    let id: String
    let `class`: Int
    let entity_type: String
    let comment: String?
}

struct GraphEdge: Codable {
    let source: String
    let target: String
    let importance: Double
}
