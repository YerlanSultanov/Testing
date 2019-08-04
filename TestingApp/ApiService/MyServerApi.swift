import Foundation
import Moya

enum MyServerApi {

    case GetData
}
let provider = MoyaProvider<MyServerApi>()
extension MyServerApi: TargetType, AccessTokenAuthorizable {
    var authorizationType: AuthorizationType {
        switch self {
        case .GetData:
            return .none
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/users")!
    }
    
    var path: String {
        switch self {
        case .GetData:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .GetData:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .GetData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    

}
