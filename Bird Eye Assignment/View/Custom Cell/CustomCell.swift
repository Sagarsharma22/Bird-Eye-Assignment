//
//  CustomCell.swift
//  Bird Eye Assignment
//
//  Created by Kripa Tripathi on 14/08/19.
//  Copyright © 2019 Maxtra Technologies. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    var customerInfo: Customer?{
        didSet{
            guard let customerInfo = customerInfo else {return}
            if !customerInfo.firstName.isEmpty && !customerInfo.lastName.isEmpty{
                nameLbl.text = customerInfo.firstName + " " + customerInfo.lastName
            }
            else if !customerInfo.firstName.isEmpty && customerInfo.lastName.isEmpty{
                nameLbl.text = customerInfo.firstName
            }
            else if customerInfo.firstName.isEmpty && !customerInfo.lastName.isEmpty{
                nameLbl.text = customerInfo.lastName
            }
            else if customerInfo.firstName.isEmpty && customerInfo.lastName.isEmpty && !customerInfo.emailId.isEmpty{
                let emailArr = customerInfo.emailId.components(separatedBy: "@")
                if !emailArr.isEmpty{
                    nameLbl.text = emailArr[0]
                }
            }
            emailLbl.text = customerInfo.emailId
            phoneLbl.text = customerInfo.phone
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
