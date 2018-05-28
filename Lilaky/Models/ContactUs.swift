import UIKit
import SwiftyJSON
class ContactUs: NSObject {
    var tele_info:String
    var email_info:String
    var web_info:String
    var location_google_lat:String
    var location_google_long:String
   
    init?(dic:[String:JSON]) {
        guard let email = dic["email_info"]?.string  else {
            return nil
        }
        self.email_info = email
        self.tele_info = dic["tele_info"]?.string ?? ""
        self.web_info = dic["web_info"]?.string ?? ""
        self.location_google_lat = dic["location_google_lat"]?.string ?? ""
        self.location_google_long = dic["location_google_long"]?.string ?? ""
    }

    
}
