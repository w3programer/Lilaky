import UIKit
import SwiftyJSON
class MyAlbums: NSObject {
    var offer_id:String = ""
    var title :String = ""
    var img :String = ""
    var detailes :String = ""
    var price :String = ""
    var size_offer :String = ""
    init?(dic:[String:JSON]) {
        guard let id = dic["offer_id"]?.string , let title = dic["title"]?.string  else {
            return nil
        }
        self.offer_id = id
        self.title = title
        self.detailes = dic["details"]?.string ?? ""
        self.img =  dic["img"]?.string ?? ""
        self.price = dic["price"]?.string ?? ""
        self.size_offer = dic["size_offer"]?.string ?? ""
        
    }
    
}

