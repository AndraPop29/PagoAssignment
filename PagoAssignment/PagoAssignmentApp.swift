//
//  PagoAssignmentApp.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import SwiftUI

@main
struct PagoAssignmentApp: App {

    var body: some Scene {
        WindowGroup {
            let repository = UsersAPIRepositoryImplementation()
            let store = UsersStoreImplementation()
            ContactsList(viewModel: ContactsListViewModel(repository: repository, localStore: store))
        }
    }
}
