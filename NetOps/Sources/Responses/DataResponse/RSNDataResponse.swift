import Foundation

public struct RSNDataResponse: RSNResponse {
    
    // MARK: - Properties -
    
    public var status: RSNResponseStatus?
    
    public var headers: RSNResponseHeaders?
    
    public var body: RSNResponseBody?
    
    public var error: Error?
    
    // MARK: - Init -
    
    public init(statusCode: Int, headers: RSNResponseHeaders? = nil, body: RSNResponseBody? = nil, error: Error? = nil) {
        self.status = RSNResponseStatus(statusCode: statusCode)
        self.headers = headers
        self.body = body
        self.error = error
    }
    
    public init(response: URLResponse?, data: Data? = nil, error: Error? = nil) {
        let httpResponse = response as? HTTPURLResponse
        self.status = RSNResponseStatus(statusCode: httpResponse?.statusCode)
        self.headers = httpResponse?.allHeaderFields
        self.body = data
        self.error = error
    }
    
}
