import Foundation

public typealias RSNRequestHeaders = [String: String]
public typealias RSNRequestBody = Data

public protocol RSNRequest {
    // MARK: Properties
    var url: URL { get }
    var method: RSNRequestMethod { get }
    var headers: RSNRequestHeaders? { get }
    var body: RSNRequestBody? { get }
}
