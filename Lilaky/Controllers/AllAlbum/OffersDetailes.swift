
import UIKit

class OffersDetailes: UIViewController {
    var offerDescription:OffersKeys?
    @IBOutlet var OfferTitle: UILabel!
    @IBOutlet var offerCover: UIImageView!
    @IBOutlet var OfferDetails: UITextView!
    @IBOutlet var OfferCost: UILabel!
    @IBOutlet var CountImage: UILabel!
    var offerid = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OfferTitle.text = offerDescription?.title
        OfferDetails.text = offerDescription?.detailes
        OfferCost.text = offerDescription?.price
        CountImage.text = offerDescription?.size_offer
        offerid = Int((offerDescription?.offer_id)!)!
        let urlString = Urls.uploads+(offerDescription?.img)!
        let url = URL(string: urlString )
        offerCover.downloadedFrom(url: url!)
    }
    @IBAction func AddPhoto(_ sender: UIButton) {
        if Helper.getUserData() == true {
            self.performSegue(withIdentifier: "createPhoto", sender: self)

        }else{
            let title:String = NSLocalizedString("report", comment: "")
            let message:String = NSLocalizedString("you should register firist", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
            self.present(alert,animated: true)

        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UploadPhotoVC {
            destination.albumid = offerid
            destination.imagecount = Int((offerDescription?.size_offer)!)!
        }
        
        
        
        
        
        //albumid
    }
}
