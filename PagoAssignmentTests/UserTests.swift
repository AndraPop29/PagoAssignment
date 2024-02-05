//
//  UserTests.swift
//  UserTests
//
//  Created by Pop, Andra on 04.02.2024.
//

import XCTest
@testable import PagoAssignment

final class UserTests: XCTestCase {
    private enum TestConstants {
        static let count = 3
    }

    func test_userMapper() throws {
        let mockupData = MockContactsListData()
        let userDTOs = try XCTUnwrap(mockupData.loadUsersDTOList())
        let users = userDTOs.compactMap { UserMapper.map($0) }
        let firstUserDTO = userDTOs.first
        let firstUser = users.first
        XCTAssertEqual(firstUserDTO?.id, firstUser?.id)
        XCTAssertEqual(firstUserDTO?.name, firstUser?.name)
        XCTAssertEqual(firstUserDTO?.email, firstUser?.email)
        XCTAssertEqual(firstUserDTO?.gender, firstUser?.gender)
        XCTAssertEqual(firstUserDTO?.status, firstUser?.status.rawValue)
    }

}
