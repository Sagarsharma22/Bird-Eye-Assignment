//
//  NewUserVC.swift
//  Bird Eye Assignment
//
//  Created by Sagar Sharma on 14/08/19.
//  Copyright © 2019 Maxtra Technologies. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire

class NewUserVC: UIViewController {

    @IBOutlet weak var firstNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var lastNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var mailTF: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileTF: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.title = "New User"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        if let msg = checkValidation(){
            showAlertMessage(vc: self, title: msg, message: nil, actionTitle: "Ok", handler: nil)
            return
        }
        newUser()
    }
    
    // validation Methods
    func checkValidation() -> String?{
        if let firstName = firstNameTF.text, firstName.isRequireEntry(){
            return "Enter Fisrt name"
        } else if let lastName = lastNameTF.text, lastName.isRequireEntry(){
            return "Enter Last name"
        }
        else if let mail = mailTF.text, !mail.isValidEmail() {
            return "Enter Valid Mail Id"
        }
        else if let mobile = mobileTF.text, mobile.isRequireEntry(){
            return "Enter Your Mobile Number"
        }
        return nil
    }
    
    }


// MARK: - Webservice Methods


extension NewUserVC {
    func newUser(){
        var params = [String: Any]()
        var employee = [String: Any]()
        CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
        employee["emailId"] = mailTF.text
        params["name"] = (firstNameTF.text ?? "") + (lastNameTF.text ?? "")
        params["emailId"] = mailTF.text
        params["phone"] = mobileTF.text
        params["smsEnabled"] = 1
        params["employees"] = [employee]
        let headers: HTTPHeaders = [
            "accept":"application/json",
            "content-type":"application/json"
        ]
        Alamofire.request("​https://api.birdeye.com/resources/v1/customer/checkin?bid=​154297123507363​&api_key=​uu7qrdki2HkQ7H7yf3diI92dkQ6uy7Hd", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                showAlertMessage(vc: self, title: "msg", message: "Data Submitted Successfully", actionTitle: "Ok",  handler:{ (action) in
                   
                 self.performSegue(withIdentifier: "CheckInSegue", sender: nil)
                })
                
            case .failure(let error):
                print(error)
            }
             CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
        }
    }
}
