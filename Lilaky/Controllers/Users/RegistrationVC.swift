//
//  RegistrationVC.swift
//  Lilaky
//
//  Created by hesham tatawy on 14/08/1439 AH.
//  Copyright © 1439 alatheertech. All rights reserved.
//

import UIKit
class RegistrationVC: UIViewController {
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PhoneTxt: UITextField!
    @IBOutlet weak var UserNameTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func RegButton(_ sender: UIButton) {
        guard let email = EmailTxt.text?.trimmed, !email.isEmpty
            ,let phone = PhoneTxt.text?.trimmed, !phone.isEmpty
            ,let username = UserNameTxt.text?.trimmed, !username.isEmpty
            ,let password = PasswordTxt.text?.trimmed, !password.isEmpty
            else {
            return
        }
        let token = ""
        Api.registration(username: username, password: password, token:token, email: email, phone: phone) { (error :Error?, success: Bool) in
            if success{
            
                let title:String = NSLocalizedString("loginmessagehead", comment: "")
                let message:String = NSLocalizedString("registrationsuccess", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)
                

                  self.performSegue(withIdentifier: "HomeSegue", sender: self)
                
            }
            
            
        }
        
        
    }

    @IBAction func EscBut(_ sender: UIButton) {
        performSegue(withIdentifier: "MainSegue", sender: self)
        dismiss(animated: true, completion: nil)

    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

   


}
