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

    let repository: UsersRepository
    var sectionHeader: String = Strings.contactsListHeader.uppercased()

    init(repository: UsersRepository) {
        self.repository = repository
        fetchUsers()
    }


    func fetchUsers() {
        Task {
            do {
                let fetchedUsers = try await repository.getUsers()
                await filterUsers(fetchedUsers)
            } catch (let error) {
                print(error)
            }
        }
    }

    func filterUsers(_ users: [User]) async {
        let filteredUsers = users.filter { $0.status == User.Status.active }
        await MainActor.run {
            self.users = filteredUsers
        }
    }
}
