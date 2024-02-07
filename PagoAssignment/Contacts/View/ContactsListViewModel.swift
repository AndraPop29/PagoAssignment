//
//  ContactsListViewModel.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import SwiftUI

final class ContactsListViewModel: ObservableObject {

    @Published
    var users: [User] = []
    var sectionHeader: String = Strings.contactsListHeader.uppercased()

    private let repository: UsersRepository

    init(repository: UsersRepository) {
        self.repository = repository
    }

    func fetchUsers() {
        Task {
            do {
                let fetchedUsers = try await repository.getUsers()
                try await filterUsers(fetchedUsers)
            } catch (let error) {
                print(error)
            }
        }
    }

    func filterUsers(_ users: [User]) async throws {
        let filteredUsers = users.filter { $0.status == User.Status.active }

        await MainActor.run {
            self.users = filteredUsers
        }
    }
}
