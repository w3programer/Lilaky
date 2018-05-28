 import Foundation
 import Alamofire
 import SwiftyJSON
 extension Api{
    class func updateprofile (userid:Int,full_name:String ,email:String ,phone_number:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
    let BaseUrl = Urls.UpdateProfile+String(userid)
    let parameters = [
        "user_name":full_name,
        "user_email": email,
        "user_phone": phone_number,
        ]
    Alamofire.request(BaseUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
        .validate(statusCode:200..<300)
        .responseJSON { response in
            switch response.result
            {
            case .failure( let error):
                completion(error , false)
            case .success(let value):
                let data = JSON(value)
                if  (data["success"].string != "0") {
                    completion(nil ,true)
                }
                
            }
            
    }
    
 }
 
 
 
 
 
 
 
 }
 
