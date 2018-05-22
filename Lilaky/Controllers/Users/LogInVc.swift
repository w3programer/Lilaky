import UIKit
class LogInVc: UIViewController  {
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!

    ////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if Helper.getUserData() == true {
            self.performSegue(withIdentifier: "HomeSegue", sender: self)
            
        }    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        self.view.endEditing(true)
//    }
    
    
    
    
    
    
    ///////  my action
    @IBAction func GoBut(_ sender: Any) {
        guard let name = UserName.text,!name.isEmpty else {return}
        guard let pass = Password.text,!pass.isEmpty else{return}
        Api.login(username: name, password: pass) { (error:Error?, success :Bool) in
            if success{
                self.performSegue(withIdentifier: "HomeSegue", sender: self)

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
       // dismiss(animated: true, completion: nil)

    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        performSegue(withIdentifier: "RegistrationSegue", sender: self)
       // dismiss(animated: true, completion: nil)
    }
   
}

