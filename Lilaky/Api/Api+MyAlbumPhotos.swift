
import Foundation
import Alamofire
import SwiftyJSON
extension Api{
    class func MyPhotos(_ albumId:String?, completion:@escaping (_ error:Error?, _ Photoes:[MyPhotoes]?)->Void){
        let url = Urls.Myphotoes+albumId!
        Alamofire.request(url).responseJSON{response in
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
                var Photoes = [MyPhotoes]()
                for data in dataArr {
                    if let data = data.dictionary ,let myphotoes = MyPhotoes.init(dic: data) {
                        Photoes.append(myphotoes)
                    }
                    
                }
                completion(nil,Photoes)
            }
            
        }
    }
}

