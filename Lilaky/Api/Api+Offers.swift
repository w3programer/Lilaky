import Foundation
import Alamofire
import SwiftyJSON
extension Api{
    class func offers(completion:@escaping (_ error:Error?, _ Offers:[OffersKeys]?)->Void){
        Alamofire.request(Urls.offers).responseJSON{response in
             switch response.result
             {
             case.failure(let error):
                completion(error,nil)
                print(error)
             case.success(let value):
//                var offer_id:String = ""
//                var title :String = ""
//                var img :String = ""
//                var detailes :String = ""
//                var price :String = ""
//                var size_offer :String = ""
                
                let json = JSON(value)
                guard let dataArr = json.array else{
                   completion(nil , nil)
                    return
                }
                
                var OffersofArray = [OffersKeys]()
                for data in dataArr {
                    if let data = data.dictionary ,let offer = OffersKeys.init(dic: data) {                        
                            OffersofArray.append(offer)
                    }

                }
               completion(nil,OffersofArray)
                
                
                
                
                
                
                
            }
            
        }
    }
}
