//
//  User.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import Foundation

struct User: Identifiable {
    enum Status: String {
        case active, inactive
    }

    var id: Int?
    var name: String
    var email: String
    var gender: String
    var status: Status

    var initials: String {
        guard id != nil else { return "" }
        let nameComponents = name.components(separatedBy: " ")
        if nameComponents.count >= 2 {
            let firstInitial = nameComponents[0].prefix(1)
            let lastInitial = nameComponents[1].prefix(1)
            return "\(firstInitial)\(lastInitial)"
        } else if let firstInitial = name.first {
            return "\(firstInitial)"
        } else {
            return ""
        }
    }
}

struct UserMapper {
    typealias DTO = UserDTO
    typealias Model = User

    static func map(_ from: DTO) -> Model {
        User(id: from.id, name: from.name, email: from.email, gender: from.gender, status: User.Status(rawValue: from.status) ?? .inactive)
    }
}
