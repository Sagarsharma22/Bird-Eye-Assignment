//
//  ValidationMethods.swift
//  Bird Eye Assignment
//
//  Created by Sagar Sharma on 14/08/19.
//  Copyright © 2019 Maxtra Technologies. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Validation

extension String{
    
    func isRequireEntry() -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString.isEmpty ? true : false
}
    func isValidEmail() -> Bool {
        print("validate emilId: \(self)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}
// message Alerts

func showAlertMessage(vc: UIViewController, title: String?, message: String?, actionTitle: String?, handler:((UIAlertAction)->Void)?) -> Void {
    let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    let alertAction = UIAlertAction(title: actionTitle, style: .cancel, handler: handler)
    
    alertCtrl.addAction(alertAction)
    vc.present(alertCtrl, animated: true, completion: nil)
}
