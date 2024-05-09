//
//  Registration.swift
//  Hotel Codable
//
//  Created by Batch-2 on 03/05/24.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    static var all: [RoomType] {
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var shortName: String
    var price: Int
}
