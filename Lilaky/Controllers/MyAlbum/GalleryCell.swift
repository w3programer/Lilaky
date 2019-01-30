import UIKit
import Kingfisher
class GalleryCell: UICollectionViewCell {
  
    @IBOutlet var GalleryPhoto: UIImageView!
    var photo :MyPhotoes?{
        didSet{
            guard let photo = photo else {
                return
            }
           self.GalleryPhoto.image =  #imageLiteral(resourceName: "Placeholder")
            self.GalleryPhoto.kf.indicatorType = .activity
            if let url = URL(string: photo.image){
                self.GalleryPhoto.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "Placeholder"), options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)

            }
            
            
        }
    }
}
