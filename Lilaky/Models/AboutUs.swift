import UIKit
import SwiftyJSON
class AboutUs: NSObject {
    var title:String
    var content:String
    
    init?(dic:[String:JSON]) {
        guard let content = dic["content"]?.string  else {
            return nil
        }
        self.content = content
        self.title = dic["title"]?.string ?? ""
    }

}
