//
//  PersonalInfoViewController.swift
//  clientRegistration
//
//  Created by Anthony MARINGO on 5/31/20.
//  Copyright © 2020 Anthony MARINGO. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    
    @IBOutlet weak var userPhoneNumberTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userZipCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // display alert
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert,animated:true,completion:nil)
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let userPhone:String = userPhoneNumberTextField.text!
        let userAddress:String = userAddressTextField.text!
        let userCity:String = userCityTextField.text!
        let userZip:String = userZipCodeTextField.text!
        
        
        
        // Check for empty fields
        if(userPhone.isEmpty  || userAddress.isEmpty || userCity.isEmpty || userZip.isEmpty){
            
            displayAlertMessage(userMessage: "Please fill in all fields")
            return
        }
        else{
            
            // save to userdefaults so we can just submit at the end
            UserDefaults.standard.set(userPhone,forKey: "userPhone")
            UserDefaults.standard.set(userAddress, forKey: "userAddress")
            UserDefaults.standard.set(userCity, forKey: "userCity")
            UserDefaults.standard.set(userZip, forKey: "userZip")
            
        }
        
    }
}
