import Foundation
import RealmSwift
class UserData: Object {
    @objc dynamic var id = 0
    @objc dynamic var username = ""
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var street = ""
    @objc dynamic var city = ""
    @objc dynamic var email = ""
    override static func primaryKey() -> String? {
                return "id"
        }
}
let realm = try! Realm()
//{
//    "username" : "Bret",
//    "name" : "Leanne Graham",
//    "phone" : "1-770-736-8031 x56442",
//    "website" : "hildegard.org",
//    "address" : {
//        "geo" : {
//            "lat" : "-37.3159",
//            "lng" : "81.1496"
//        },
//        "street" : "Kulas Light",
//        "city" : "Gwenborough",
//        "suite" : "Apt. 556",
//        "zipcode" : "92998-3874"
//    },
//    "id" : 1,
//    "company" : {
//        "catchPhrase" : "Multi-layered client-server neural-net",
//        "name" : "Romaguera-Crona",
//        "bs" : "harness real-time e-markets"
//    },
//    "email" : "Sincere@april.biz"
//}
