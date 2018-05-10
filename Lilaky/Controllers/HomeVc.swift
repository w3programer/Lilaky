
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
        showNavigationBar()
        let rvc = self.storyboard?.instantiateViewController(withIdentifier: "NaveMenu") as! NaveMenu
            self.slideMenuController()?.rightViewController = rvc
            self.slideMenuController()?.addRightGestures()
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    @IBAction func NewAlbum(_ sender: Any) {
        self.performSegue(withIdentifier: "NewAlbum", sender: self)
        dismiss(animated: true, completion: nil)

        
    }
    
    @IBAction func Myalbum(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Myalbum", sender: self)
        dismiss(animated: true, completion: nil)


    }
    
    

}
