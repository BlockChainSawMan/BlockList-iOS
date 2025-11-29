//
//  Trade.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import Foundation

struct Trade: Codable, Hashable, Identifiable {
    let id: String
    let date: String
    let firstAddress: String
    let secondAddress: String
    let price: Int
    let coin: String
    
    static let dummyTrades: [Trade] = [
        Trade(
            id: "1",
            date: "2023-11-02 03:52:44",
            firstAddress: "165849653",
            secondAddress: "165849656",
            price: 810709,
            coin: "원"
        ),
        Trade(
            id: "2",
            date: "2025-12-30 05:33:30",
            firstAddress: "355998241",
            secondAddress: "355158933",
            price: 1884547,
            coin: "원"
        ),
        Trade(
            id: "3",
            date: "2022-07-12 04:33:41",
            firstAddress: "99636365",
            secondAddress: "100045534",
            price: 1931842,
            coin: "원"
        ),
        Trade(
            id: "4",
            date: "2019-01-24 14:58:22",
            firstAddress: "210640906",
            secondAddress: "60114653",
            price: 2957072,
            coin: "원"
        ),
        Trade(
            id: "5",
            date: "2021-02-24 15:31:38",
            firstAddress: "226668046",
            secondAddress: "179113037",
            price: 797632,
            coin: "원"
        ),
        Trade(
            id: "6",
            date: "2023-01-24 05:47:30",
            firstAddress: "175046585",
            secondAddress: "179111799",
            price: 1426737,
            coin: "원"
        ),
        Trade(
            id: "7",
            date: "2022-04-05 21:53:29",
            firstAddress: "89273",
            secondAddress: "49960790",
            price: 62476,
            coin: "원"
        ),
        Trade(
            id: "8",
            date: "2020-06-26 05:48:54",
            firstAddress: "12780715",
            secondAddress: "12780542",
            price: 1468783,
            coin: "원"
        ),
        Trade(
            id: "9",
            date: "2020-02-16 11:59:28",
            firstAddress: "155720756",
            secondAddress: "12172125",
            price: 2014428,
            coin: "원"
        ),
        Trade(
            id: "10",
            date: "2016-08-12 10:47:42",
            firstAddress: "103206927",
            secondAddress: "187110962",
            price: 1947159,
            coin: "원"
        )
    ]
}
