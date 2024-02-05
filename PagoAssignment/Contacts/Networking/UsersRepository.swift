//
//  UsersRepository.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import Foundation

protocol UsersRepository {
    func getUsers() async throws -> [User]
}

class UsersRepositoryImplementation: UsersRepository {

    func getUsers() async throws -> [User] {
        guard let url = URL(string: Strings.usersURL) else {
            return []
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let userDTOs = try JSONDecoder().decode([UserDTO].self, from: data)
        let users = userDTOs.compactMap { UserMapper.map($0) }

        return users
    }
}
