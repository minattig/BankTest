//
//  Teste.swift
//  SantanderTest
//
//  Created by Gustavo Minatti on 28/06/22.
//

import UIKit

class RecentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paymentDataLabel: UILabel!
    @IBOutlet weak var electricityBillLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
