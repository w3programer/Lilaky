
import UIKit
import SlideMenuControllerSwift

class HomeVc: SlideMenuController {

    var action = false
    @IBAction func NaveButton(_ sender: UIButton) {
        if !action {
            self.slideMenuController()?.openRight()
            action = true
        }else{
            self.slideMenuController()?.closeRight()
            action = false
            
        }
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let image = UIImage(named:"spalsh")?.encodeimage(format: .JPEG(50))
       // print(image ?? "")
        let rvc = self.storyboard?.instantiateViewController(withIdentifier: "NaveMenu") as! NaveMenu
            self.slideMenuController()?.rightViewController = rvc
            self.slideMenuController()?.addRightGestures()
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showNavigationBar()
    }

    @IBAction func NewAlbum(_ sender: Any) {
        self.performSegue(withIdentifier: "NewAlbum", sender: self)
        //dismiss(animated: true, completion: nil)

        
    }
    
    @IBAction func Myalbum(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MyalbumSegue", sender: self)
        dismiss(animated: true, completion: nil)


    }
    
    

}
