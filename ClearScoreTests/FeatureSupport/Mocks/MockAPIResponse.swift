import Foundation
struct MockAPIResponse {
    static func loadContents(of fileNamed: String, with fileType: String) throws -> Data {
        let bundle = Bundle(for: DashboardViewModelTests.self)
        guard let url = bundle.url(forResource: fileNamed, withExtension: fileType) else {
            preconditionFailure("file \(fileNamed) not found in \(bundle.bundlePath)")
        }
        return try Data(contentsOf: url)
    }
}
