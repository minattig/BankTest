//
//  PresenterHome.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 21/06/22.
//

import UIKit
import Foundation

class PresenterHome {
    
    var service: HomeService?
    var homeViewController: HomeViewController?
    
    init(service: HomeService, homeViewController: HomeViewController) {
        self.service = service
        self.service?.presenter = self
        self.homeViewController = homeViewController
    }
    
    //MARK: - Methods
    func didUpdateBalance() {
        service?.performRequest()
    }
    
    func receiveData(balance: [UserDataBalance]) {
        homeViewController?.updateDataScreen(balance: balance)
    }
    
    
    
}
