import Foundation

public typealias RSNResponseHeaders = [AnyHashable: Any]
public typealias RSNResponseBody = Data

public protocol RSNResponse {
    // MARK: Properties
    var status: RSNResponseStatus? { get }
    var headers: RSNResponseHeaders? { get }
    var body: RSNResponseBody? { get }
    var error: Error? { get }
}
