import UIKit
class ProfileVc: UIViewController {

    @IBOutlet var logo: UIImageView!
    
    @IBOutlet var userName: UITextField!
    
    @IBOutlet var email: UITextField!
    @IBOutlet var Phone: UITextField!
    var userid = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.layer.cornerRadius = logo.layer.frame.size.width/2
        logo.clipsToBounds = true
      showNavigationBar()
            let def = UserDefaults.standard
         userid =  (def.object(forKey: "user_id") as! Int)
          userName.text =  (def.object(forKey: "user_name") as! String)
           email.text =  (def.object(forKey: "user_email") as! String)
        Phone.text =  String((def.object(forKey: "user_phone") as! Int))

    }
    @IBAction func UpdateButton(_ sender: UIButton) {
        Api.updateprofile(userid:userid,full_name: userName.text!, email:email.text!, phone_number: Phone.text!) { (error:Error?, success :Bool) in
            let title:String = NSLocalizedString("report", comment: "")
            let message:String = NSLocalizedString("updated success", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert,animated: true)
        }
        
    }    
    }
    


