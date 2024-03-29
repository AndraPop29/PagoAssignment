//
//  UsersRemoteDataSource.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 07.02.2024.
//

import Foundation

class UsersRemoteDataSource: UsersDataSource {
    func load() async throws -> [User] {
        guard let url = URL(string: Strings.usersURL) else {
            return []
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let userDTOs = try JSONDecoder().decode([UserDTO].self, from: data)
        let users = userDTOs.compactMap { UserMapper.map($0) }

        return users
    }
}
