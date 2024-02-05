//
//  MockUsersRepository.swift
//  PagoAssignmentTests
//
//  Created by Pop, Andra on 04.02.2024.
//

@testable import PagoAssignment

final class MockUsersRepository: UsersRepository {
    var users: [User] = []
    func getUsers() async throws -> [User] {
        return users
    }

}
