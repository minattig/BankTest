//
//  LoginService.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 18/06/22.
//

import UIKit
import Foundation

protocol LoginServiceDelegate {
    func didUpdateUserInformation(user: [UserDataModel])
    
    func didFailWithError(error: Error)
}

struct LoginService {
    
    let urlString = "https://60bd336db8ab3700175a03b3.mockapi.io/treinamento/Login#"
    
    var presenter: PresenterLogin?
    var delegate: LoginServiceDelegate?
    
    func performRequest() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([UserDataModel].self, from: data)
                        DispatchQueue.main.async {
                            presenter?.showStatementScreen(user: result)
                        }
                    } catch let error {
                        //delegate?.didFailWithError(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}

        
    
    
    
    

