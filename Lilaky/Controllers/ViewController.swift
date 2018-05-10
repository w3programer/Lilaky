import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController  {
    
    @IBOutlet weak var EscOutlet: UIButton!
    @IBOutlet weak var RegistrationOutlet: UIButton!
    @IBOutlet weak var LoginOutlet: UIButton!
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!

    ////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        translationcomponent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    ///////  my action
    @IBAction func GoBut(_ sender: Any) {
        guard let name = UserName.text,!name.isEmpty else {return}
        guard let pass = Password.text,!pass.isEmpty else{return}
        Api.login(username: name, password: pass) { (error:Error?, success :Bool) in
            if success{
    
            }else{
                let title:String = NSLocalizedString("loginmessagehead", comment: "")
                let message:String = NSLocalizedString("connectionbody", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
                self.present(alert,animated: true)

            }
        }
        

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func EscAction(_ sender: Any) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        performSegue(withIdentifier: "RegistrationSegue", sender: self)
        dismiss(animated: true, completion: nil)
    }
    
    
    func translationcomponent() {
      LoginOutlet.setTitle(NSLocalizedString("LoginButton", comment: ""), for: .normal)
        RegistrationOutlet.setTitle(NSLocalizedString("Regstration", comment: ""), for: .normal)
        EscOutlet.setTitle(NSLocalizedString("Esc", comment: ""), for: .normal)

        
        
        
    }
    
    

    
}

