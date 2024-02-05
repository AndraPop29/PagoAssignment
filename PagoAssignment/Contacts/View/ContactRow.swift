//
//  ContactRow.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import SwiftUI

struct ContactRow: View {
    let user: User

    var body: some View {
        HStack(spacing: 16) {
            leftLogo
                .clipShape(Circle())
            Text(user.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .imageScale(.large)
         }
        .padding(.top, 16)
        .padding(.bottom, 16)
    }

    @ViewBuilder private var leftLogo: some View {
        if !user.initials.isEmpty {
            Text(user.initials)
                .fontWeight(.bold)
                .frame(width: 50, height: 50)
                .padding(2)
                .background(Color.gray.opacity(0.8))
                .foregroundColor(.white)
        } else {
            AsyncImage(url: URL(string: "https://picsum.photos/200/200"))
                .frame(width: 50, height: 50)
        }
    }

}
