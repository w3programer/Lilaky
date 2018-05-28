import UIKit
class ContactUsVC: UIViewController {
    @IBOutlet var Email: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var site: UILabel!
    var lat = ""
    var lang = ""
    
    @IBOutlet var FullName: UITextField!
    @IBOutlet var emailinput: UITextField!
    @IBOutlet var phoneinput: UITextField!
    @IBOutlet var Message: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
      contactinfo()

    }
    
    
    
    func contactinfo(){
   
        Api.mycontact{(error: Error?,info:[ContactUs]?)in
            
            if let data = info {
                self.Email.text = data[0].email_info
                self.phone.text = data[0].tele_info
                self.site.text = data[0].web_info
           }
        }
    }
    
    
    
    @IBAction func SendEmail(_ sender: UIButton) {
        Api.contactUs(full_name: FullName.text!, email:emailinput.text!, phone_number: phoneinput.text!, message: Message.text!) { (error:Error?, success :Bool) in
         
                let title:String = NSLocalizedString("report", comment: "")
                let message:String = NSLocalizedString("message sent successfuly", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)

      
            
        }
        
    }
}
