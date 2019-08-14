//
//  ViewController.swift
//  Bird Eye Assignment
//
//  Created by Sagar Sharma on 14/08/19.
//  Copyright © 2019 Maxtra Technologies. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var dataArray: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiData()
        self.title = "Bird Eye"
    }
    
    
}

// MARK: - UITableViewDatasource

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CustomCell" , for: indexPath) as! CustomCell
        cell.customerInfo = dataArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Remove Product", message: "Are you sure you want to remove this product?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                let customerNumber = self.dataArray[indexPath.row].number
                self.deleteData(customerId: customerNumber)
            })
            let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Webservice Methods

extension ViewController {
    func getApiData() {
        CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
        let headers: HTTPHeaders = [
            "Accept":"application/json",
            "Content-Type":"application/json"
        ]
        Alamofire.request("https://api.birdeye.com/resources/v1/customer/all?businessId=154297123507363&api_key=uu7qrdki2HkQ7H7yf3diI92dkQ6uy7Hd", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                guard let data = response.result.value as? [[String:Any]] else {return}
                self.dataArray = Customer.array(jsonObject: data)
            case .failure(let error):
                print(error)
            }
            CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
            self.tblView.reloadData()
            
        }
    }
    
    func deleteData(customerId:String) {
        CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
        let headers: HTTPHeaders = [
            "Accept":"application/json",
            "Content-Type":"application/json"
        ]
        Alamofire.request("https://api.birdeye.com/resources/v1/customer/id/customerId?api_key=​uu7qrdki2HkQ7H7yf3diI92dkQ6uy7Hd", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                guard let data = response.result.value as? [[String:Any]] else {return}
                self.dataArray = Customer.array(jsonObject: data)
            case .failure(let error):
                print(error)
            }
             CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
            self.tblView.reloadData()
        }
    }
}
