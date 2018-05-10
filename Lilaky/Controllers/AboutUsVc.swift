
import UIKit

class AboutUsVc: UIViewController {
    let selecteddictionary = ["first":"value of first", "secound": "value of secound"]
    
    
    @IBOutlet var LogoImage: UIImageView!
   
    @IBOutlet var TitleLable: UILabel!
    
    @IBOutlet var TextBody: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       showNavigationBar()
        LogoImage.layer.cornerRadius = LogoImage.layer.frame.size.width/2
        LogoImage.clipsToBounds = true
        ///////////////
        
        

    }

   

}
