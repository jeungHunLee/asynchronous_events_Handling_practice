//
//  Sub.swift
//  Api_test
//
//  Created by 이정훈 on 2023/03/01.
//

import Foundation

// MARK: - BusList
struct BusList: Codable {
    let response: BusList_Response
}

// MARK: - Response
struct BusList_Response: Codable {
    let header: BusList_Header
    let body: BusList_Body
}

// MARK: - Body
struct BusList_Body: Codable {
    let items: BusList_Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct BusList_Items: Codable {
    let item: [BusList_Item]
}

// MARK: - Item
struct BusList_Item: Codable {
    let arrprevstationcnt, arrtime: Int
    let nodeid: Nodeid
    let nodenm: Nodenm
    let routeid: String
    let routeno: Routeno
    let routetp: Routetp
    let vehicletp: Vehicletp
}

enum Nodeid: String, Codable {
    case ggb228000158 = "GGB228000158"
}

enum Nodenm: String, Codable {
    case 동백이마트 = "동백이마트"
}

enum Routeno: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Routeno.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Routeno"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum Routetp: String, Codable {
    case 일반버스 = "일반버스"
    case 직행좌석버스 = "직행좌석버스"
}

enum Vehicletp: String, Codable {
    case 일반차량 = "일반차량"
}

// MARK: - Header
struct BusList_Header: Codable {
    let resultCode, resultMsg: String
}
