
import Foundation
import Alamofire
import SwiftyJSON
extension Api{
   
    
    
    class func mycontact(completion:@escaping (_ error:Error?, _ info:[ContactUs]?)->Void){
        Alamofire.request(Urls.ContactUs).responseJSON{response in
            switch response.result
            {
            case.failure(let error):
                completion(error,nil)
                print(error)
            case.success(let value):
                let json = JSON(value)
                guard let dataArr = json.dictionary else{
                    completion(nil , nil)
                    return
                }
                var contactsinfo = [ContactUs]()
             
                    if let datainfo = ContactUs.init(dic: dataArr) {
                        contactsinfo.append(datainfo)
                        //print(contactsinfo[0].email_info)
                    }
                
                completion(nil,contactsinfo)
            }
            
        }
    }
 ///////////////send contacts email
    class func contactUs (full_name:String ,email:String ,phone_number:String,message:String,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let BaseUrl = Urls.ContactUs
        let parameters = [
            "full_name":full_name,
            "email": email,
             "phone_number": phone_number,
              "message": message,
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








