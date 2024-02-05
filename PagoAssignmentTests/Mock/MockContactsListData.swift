//
//  ContactsListResources.swift
//  PagoAssignmentTests
//
//  Created by Pop, Andra on 04.02.2024.
//

@testable import PagoAssignment
import XCTest

class MockContactsListData {
    func loadData() throws -> Data? {
        var data: Data?
        let testBundle = Bundle(for: MockContactsListData.self)
        if let fileUrl = testBundle.url(forResource: "users", withExtension: "json") {
            data = try Data(contentsOf: fileUrl)
        }

        return data
    }

    func loadUsersDTOList() throws -> [UserDTO] {
        let data = try XCTUnwrap(loadData())
        do {
            let result = try JSONDecoder().decode([UserDTO].self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
