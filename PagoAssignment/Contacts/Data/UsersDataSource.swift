//
//  UsersDataSource.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 07.02.2024.
//

protocol UsersDataSource {
    func load() async throws -> [User]
    func save(users: [User]) async throws
}

extension UsersDataSource {
    func save(users: [User]) async throws {}
}
