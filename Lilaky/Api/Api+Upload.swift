 import Foundation
 import  Alamofire
 import  SwiftyJSON
 extension Api{
    class func uploadimages(requestedfile:[String] ,useridfk:Int ,offer_id:Int,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let url = Urls.reserveOffer
        let parameters = [
            "user_id":useridfk,
            "offer_id": offer_id,
            "images": requestedfile
            
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    let data = JSON(value)
                    if  (data["success"].int != 0) {
                        print("success uploading file")
                        completion(nil ,true)
                    }else{
                        print("error while uploade")
                        completion(nil , false)
                    }
                    
                }
                
        }
        
    }
    
 }
