//
//  HomeService.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 24/06/22.
//

import Foundation

class HomeService {
    
    var presenter: PresenterHome?
    let urlString = "https://60bd336db8ab3700175a03b3.mockapi.io/treinamento/payments"
    
    func performRequest() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([UserDataBalance].self, from: data)
                        DispatchQueue.main.async {
                            self.presenter?.receiveData(balance: result)
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

