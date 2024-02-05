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
            let repository = UsersRepositoryImplementation()
            ContactsList(viewModel: ContactsListViewModel(repository: repository))
        }
    }
}
