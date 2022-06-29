//
//  UserData.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 15/06/22.
//

import Foundation

struct UserDataModel: Decodable {
    let customerName: String
    let accountNumber: String
    let branchNumber: String
    let checkingAccountBalance: Int
    let id: String
}
