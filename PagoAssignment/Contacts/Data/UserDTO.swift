//
//  UserDTO.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import Foundation

struct UserDTO: Codable {
    var id: Int?
    var name: String
    var email: String
    var gender: String
    var status: String
}
