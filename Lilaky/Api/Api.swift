
import UIKit
import Alamofire
import  SwiftyJSON
class Api: NSObject {
    ///////  login
    class func login(username:String ,password:String ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = Urls.login
        let parameters = [
            "user_name":username,
            "user_pass": password
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
                        ///////
                        let user_id = Int(data["user_id"].string!)!
                        let user_name = data["user_name"].string
                        let user_phone = Int(data["user_phone"].string!)
                        let user_email = data["user_email"].string
                        /////////
                        Helper.setUserData(user_id: user_id, user_email: user_email!, user_name: user_name!, user_phone: user_phone!)
                        completion(nil ,true)
                    }
                    
                }
                
        }

    }
///////  registration
    
    class func registration(username:String ,password:String ,token:String,email:String,phone:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = Urls.register
        let parameters = [
            "user_name":username,
            "user_pass": password,
            "user_email":email,
            "user_phone": phone,
             "token_id": token
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
                    
                    if  (data["success"].string == "1") {
                        
                        ///////
                        let user_id = Int(data["user_id"].string!)!
                        let user_name = data["user_name"].string
                        let user_phone = Int(data["user_phone"].string!)
                        let user_email = data["user_email"].string
                        /////////
                        Helper.setUserData(user_id: user_id, user_email: user_email!, user_name: user_name!, user_phone: user_phone!)
                        completion(nil ,true)
                    }
                }
                
        }
        
    }
  //////////////all offers
    
    
}
