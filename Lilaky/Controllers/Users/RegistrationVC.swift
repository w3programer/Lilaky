
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
        Api.registration(username: username, password: password, email: email, phone: phone, completion: { (error:Error?, success :Bool) in
            
            
            if (error != nil) {
              
                
                let title:String = NSLocalizedString("loginmessagehead", comment: "")
                let message:String = NSLocalizedString("connectionbody", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
                self.present(alert,animated: true)
            }else{
           
                
                let title:String = NSLocalizedString("message title", comment: "")
                let message:String = NSLocalizedString("message body", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)

                
            }
        })
        
        
        self.performSegue(withIdentifier: "authsegue", sender: self)

        
        
        
        
        
        


    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

   


}
