//
//  UsersLocalDataSource.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 05.02.2024.
//

import SwiftUI

class UsersLocalDataSource: UsersDataSource {
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("pago.users.data")
    }

    func load() async throws -> [User] {
        let task = Task<[UserDTO], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let userDTOs = try JSONDecoder().decode([UserDTO].self, from: data)
            return userDTOs
        }
        let userDTOs = try await task.value
        return userDTOs.compactMap { UserMapper.map($0) }
    }

    func save(users: [User]) async throws {
        let task = Task {
            let userDTOs = users.compactMap { UserMapper.dto($0) }
            let data = try JSONEncoder().encode(userDTOs)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
