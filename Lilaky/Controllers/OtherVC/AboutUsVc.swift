
import UIKit

class AboutUsVc: UIViewController {
    @IBOutlet var LogoImage: UIImageView!
    @IBOutlet var Textgooal: UITextView!
    @IBOutlet var Textmessage: UITextView!
    @IBOutlet var Textvision: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       showNavigationBar()
        LogoImage.layer.cornerRadius = LogoImage.layer.frame.size.width/2
        LogoImage.clipsToBounds = true
        results()
    }
    func results(){
        
        Api.Aboutus{(error: Error?,data:[AboutUs]?)in
            
            if let result = data {
                self.Textgooal.text =   result[0].content
                self.Textmessage.text = result[1].content
                self.Textvision.text =  result[2].content
            }
        }
    }
    
    
   

}
