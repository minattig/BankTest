//
//  ViewController.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 15/06/22.
//

import UIKit

class UserViewController: UIViewController {

    let saveUser = UserDefaults.standard
    let savePassword = UserDefaults.standard
    
    var user: UserDataModel?
    var presenter: PresenterLogin?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = LoginService()
        presenter = PresenterLogin(service: service)
        presenter?.viewController = self
        
        let savedUser = saveUser.object(forKey: K.savedUser) as? String ?? K.blankText
        let savedPassword = savePassword.object(forKey: K.savedPassword) as? String ?? K.blankText
        
        userTextField.text = savedUser
        passwordTextField.text = savedPassword
    }

    //MARK: - UIAction
    @IBAction func pressedToLogin(_ sender: UIButton) {
        let user = userTextField.text
        let password = passwordTextField.text
        let isValidUser = presenter?.isValidUser(user!)
        let isValidPassword = presenter?.isValidPassword(password!)
        if isValidUser! && isValidPassword! {
            //Save data
            saveUser.set(user, forKey: K.savedUser)
            savePassword.set(password, forKey: K.savedPassword)
            
            presenter?.getRequest()
            
            print(Message.success)
        } else {
            print(Message.fail)
        }
    }

    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as? HomeViewController
        homeViewController?.userVC = self
        homeViewController?.user = user
    }

    func showStatementsScreen(user: [UserDataModel]) {
        self.user = user[0]
        performSegue(withIdentifier: K.goHome, sender: self)
    }
    
    //MARK: - Methods
    func resetLogin() {
        passwordTextField.text = K.blankText
    }
    
}
