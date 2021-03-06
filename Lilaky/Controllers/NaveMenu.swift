
import UIKit

class NaveMenu: UIViewController {

    @IBOutlet var LogoImage: UIImageView!
    @IBOutlet var UserName: UILabel!
    override func viewDidLoad() {
        LogoImage.layer.cornerRadius = LogoImage.layer.frame.size.width/2
        LogoImage.clipsToBounds = true
        super.viewDidLoad()
        hideNavigationBar()
        let def = UserDefaults.standard
        //                        Helper.setUserData(user_id: user_id, user_email: user_email!, user_name: user_name!, user_phone: user_phone!)

        UserName.text =  (def.object(forKey: "user_name") as! String)

    }
    @IBAction func Profile(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "ProfileSegue", sender: self)

    }

    @IBAction func AboutUs(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "AboutUsSegue", sender: self)

    }
    
    @IBAction func ContactUs(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "ContactUsSegue", sender: self)

        
    }
    
    @IBAction func Share(_ sender: UIButton) {

            let text = "This is the text...."
            let image = UIImage(named: "mainlogo")
            let myWebsite = NSURL(string:"https://itunes.apple.com/us/app/ليلكي/id1390772349?ls=1&mt=8")
            let shareAll = [text , image! , myWebsite ?? "logo"] as [Any]
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
 
    }
    
    @IBAction func LogOut(_ sender: UIButton) {
   
       Helper.logout()
        self.performSegue(withIdentifier: "LogOutSegue", sender: self)
    
    }
    
    
    
}
