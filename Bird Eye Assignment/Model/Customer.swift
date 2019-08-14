//
//  Customer.swift
//  Bird Eye Assignment
//
//  Created by Kripa Tripathi on 14/08/19.
//  Copyright © 2019 Maxtra Technologies. All rights reserved.
//

import Foundation

struct Customer{
    
    //MARK: - Instance Properties
    
    public let emailId: String
    public let firstName: String
    public let lastName: String
    public let middleName: String
    public let number: String
    public let phone: String
    
    //MARK: - Object LifeCycle
    
    public init? (json:[String:Any]){
        let emailId = json["emailId"] as? String
        let firstName = json["firstName"] as? String
        let lastName = json["lastName"] as? String
        let middleName = json["middleName"] as? String
        let number = json["number"] as? String
        let phone = json["phone"] as? String
        
        self.emailId = emailId ?? ""
        self.firstName = firstName ?? ""
        self.lastName = lastName  ?? ""
        self.middleName = middleName  ?? ""
        self.number = number  ?? ""
        self.phone = phone  ?? ""
    }
    
    static func array(jsonObject: [[String:Any]])->[Customer]{
        var customerArr: [Customer] = []
        jsonObject.forEach { json in
            guard let infoDict = Customer(json: json) else { return }
            customerArr.append(infoDict)
        }
        return customerArr
    }
}
