import Foundation
import Alamofire
import SwiftyJSON
extension Api{
    class func Aboutus(completion:@escaping (_ error:Error?, _ data:[AboutUs]?)->Void){
        Alamofire.request(Urls.AboutUs).responseJSON{response in
            switch response.result
            {
            case.failure(let error):
                completion(error,nil)
                print(error)
            case.success(let value):
                let json = JSON(value)
               // print(json)
                guard let dataArr = json.array else{
                    completion(nil , nil)
                    return
                }
                var results = [AboutUs]()
                for data in dataArr {

                if let data = data.dictionary ,let info = AboutUs.init(dic: data) {
                    results.append(info)
                }  
                }
                completion(nil,results)
            }
            
        }
    }
    
}
