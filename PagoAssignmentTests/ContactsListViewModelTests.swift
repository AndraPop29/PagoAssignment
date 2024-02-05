//
//  ContactsListViewModelTests.swift
//  PagoAssignmentTests
//
//  Created by Pop, Andra on 04.02.2024.
//

@testable import PagoAssignment
import XCTest

class ContactsListViewModelTests: XCTestCase {
    func test_fetchActiveContactsList() async throws {
        let mockupData = MockContactsListData()
        let userDTOs = try XCTUnwrap(mockupData.loadUsersDTOList())
        let users = userDTOs.compactMap { UserMapper.map($0) }
        let repository = MockUsersRepository()
        repository.users = users
        let contactsListViewModel = ContactsListViewModel(repository: repository)
        await contactsListViewModel.filterUsers(users)
        XCTAssertEqual(contactsListViewModel.users.count, 2)
    }
}
