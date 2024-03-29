//
//  ContactsList.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import SwiftUI

struct ContactsList: View {

    @ObservedObject
    var viewModel: ContactsListViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text(viewModel.sectionHeader)
                    .fontWeight(.bold)
                    .foregroundColor(.gray.opacity(0.8))
                ) {
                    ForEach(viewModel.users) { contact in
                        ContactRow(user: contact)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return -viewDimensions.width
                    }
                }
            }
            .navigationBarBackground()
            .listStyle(GroupedListStyle())
            .navigationTitle(Strings.contactsListTitle)
            .toolbar {
                NavigationLink(destination: AddContact()) {
                    Image(systemName: "chevron.right")
                }
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
