//
//  AddContact.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 12.02.2024.
//

import SwiftUI

struct AddContact: View {
    @State private var username: String = ""
    @State private var fullName: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
            TextField("Username", text: $username)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Full name")
            TextField("Full name", text: $fullName)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button {
                
            } label: {
                Text("Bordered Prominent")
                    .frame(maxWidth: .infinity)
            }
            .navigationTitle(Strings.contactsListTitle)
            .buttonStyle(.borderedProminent)
            .padding(16)
        }
        .padding(16)
    }
}
