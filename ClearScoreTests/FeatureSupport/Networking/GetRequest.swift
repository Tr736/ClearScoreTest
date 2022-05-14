import Foundation
@testable import ClearScore
struct GetRequest: APIRequest {
    typealias ResponseBody = APIRequestEmptyObject

    let method = RequestMethod.get
    let path = "testPath/foo/bar"
}
