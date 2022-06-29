////
////  Logic Login.swift
////  SantanderTest
////
////  Created by Gustavo Minatti on 27/06/22.
////
//
//import Foundation
//
//struct LogicLogin {
//
//    static func isValidUser(_ user: String) -> Bool {
//        let userRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let userPred = NSPredicate(format:"SELF MATCHES %@", userRegEx)
//
//
//
//        return userPred.evaluate(with: user)
//    }
//
//    static func isValidPassword(_ password: String) -> Bool {
//        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{6,}"
//        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
//
//
//
//        return passwordPred.evaluate(with: password)
//    }
//}
