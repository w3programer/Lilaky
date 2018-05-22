import Foundation
import Alamofire
import SwiftyJSON
extension Api{
    class func Myalbums(completion:@escaping (_ error:Error?, _ Albums:[MyAlbums]?)->Void){
        Alamofire.request(Urls.MyAlbums).responseJSON{response in
            switch response.result
            {
            case.failure(let error):
                completion(error,nil)
                print(error)
            case.success(let value):
                
                let json = JSON(value)
                guard let dataArr = json.array else{
                    completion(nil , nil)
                    return
                }
                
                var Albums = [MyAlbums]()
                for data in dataArr {
                    if let data = data.dictionary ,let myalbums = MyAlbums.init(dic: data) {
                        Albums.append(myalbums)
                    }
                    
                }
                completion(nil,Albums)
            }
            
        }
    }
}

