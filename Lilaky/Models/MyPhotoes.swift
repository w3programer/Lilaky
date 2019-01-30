import UIKit
import SwiftyJSON
class MyPhotoes: NSObject {
    var image :String = ""
    var image_id :String = ""
    init?(dic:[String:JSON]) {
        guard let image = dic["image"]?.toImagePath , let image_id = dic["image_id"]?.string  else {
            return nil
        }
        self.image = image
        self.image_id = image_id
    }
  
}
