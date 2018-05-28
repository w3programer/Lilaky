
import Foundation
struct Urls {
    static let main = "http://lilaky.com/"
    static let login = main + "Api/Login/"
    static let register = main + "Api/InsertRegistration/"
    static let offers = main + "Api/AllOffers/"
    static let reserveOffer = main + "Api/SubscribeOffer/"
    static let MyAlbums = main + "Api/MyOffers/"+String(Helper.getuserid())
    static let Myphotoes = main + "Api/MyOffersImages/"
    static let ContactUs = main + "Api/ContactUs/"
    static let AboutUs = main + "Api/AboutUs/"
     static let Profile = main + "Api/MyProfile/"
    static let UpdateProfile = main + "Api/UpdateProfile/"
    static let uploads = main + "uploads/images/"
}
