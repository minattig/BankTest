//
//  HomeBank.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 15/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: PresenterHome?
    var userVC: UserViewController?
    var user: UserDataModel!
    var dataBalance: [UserDataBalance?] = []
    var saveCount: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.customerName
        
        accountNumberLabel.text = "\(user.branchNumber) / \(user.checkingAccountBalance).\(user.accountNumber)-\(user.id)"
        
        let service = HomeService()
        presenter = PresenterHome(service: service, homeViewController: self)
        
        presenter?.didUpdateBalance()
        
        updateTableView()
    }
    //MARK: - UIActions
    @IBAction func logOutPressed(_ sender: UIButton) {
        
        dismiss(animated: true) {
            self.userVC?.resetLogin()
        }
        
        print(Message.logOut)
    }
    
    func displayAlert() {
           // Declare Alert message
           let dialogMessage = UIAlertController(title: "Yes", message: "Are you sure you want to logout?", preferredStyle: .alert)
           
           // Create OK button with action handler
           let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
               print("Ok button tapped")
               self.deleteRecord()
           })
           
           // Create Cancel button with action handlder
           let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
               print("Cancel button tapped")
           }
           
           //Add OK and Cancel button to dialog message
           dialogMessage.addAction(ok)
           dialogMessage.addAction(cancel)
           
           // Present dialog message to user
           self.present(dialogMessage, animated: true, completion: nil)
        
    }
       
    func deleteRecord() {
        print("Delete record function called")
    }
    
    //MARK: - Methods
    func updateDataScreen(balance: [UserDataBalance]) {
        let currentValue = balance[0]
        currentBalance.text = currentValue.id
        saveCount = balance.count
        dataBalance = balance
        tableView.reloadData()
    }
    
    func updateTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.recentsTableViewCell, bundle: nil), forCellReuseIdentifier: K.goCell)
    }
    
}
//MARK: - UITableView
extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = saveCount
        return count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.goCell, for: indexPath) as! RecentsTableViewCell
        
        cell.paymentDataLabel.text = dataBalance[indexPath.row]?.paymentDate
        cell.electricityBillLabel.text = dataBalance[indexPath.row]?.electricityBill
        cell.idLabel.text = dataBalance[indexPath.row]?.id
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}

