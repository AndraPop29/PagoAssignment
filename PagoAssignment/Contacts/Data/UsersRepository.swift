//
//  UsersRepository.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import Foundation

protocol UsersRepository {
    func getUsers() async throws -> [User]
}

class UsersRepositoryImplementation: UsersRepository {

    private let remoteDataSource: UsersDataSource
    private let localDataSource: UsersDataSource

    init(remoteDataSource: UsersDataSource, localDataSource: UsersDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func getUsers() async throws -> [User] {
        do {
            let localUsers = try await localDataSource.load()
            if localUsers.isEmpty {
                let remoteUsers = try await remoteDataSource.load()
                try await localDataSource.save(users: localUsers)
                return remoteUsers
            } else {
                return localUsers
            }
        } catch (let error) {
            print(error)
            return []
        }
    }
}
