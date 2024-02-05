//
//  MockUsersStore.swift
//  PagoAssignmentTests
//
//  Created by Pop, Andra on 05.02.2024.
//

@testable import PagoAssignment

final class MockUsersStore: UsersStore {
    var users: [User] = []
    func load() async throws -> [User] {
        return users
    }
    func save(users: [PagoAssignment.User]) async throws {}
}
