import Foundation
@testable import ClearScore
struct GetRequestWithObject: APIRequest {
    typealias ResponseBody = TestResponseObject

    let method = RequestMethod.get
    let path = "testPath/foo/bar"
}
