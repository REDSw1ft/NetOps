import Foundation

public struct RSNDownloadResponse: RSNResponse {
    
    // MARK: - Properties -
    
    public var status: RSNResponseStatus?
    
    public var headers: RSNResponseHeaders?
    
    public var body: RSNResponseBody?
    
    public var error: Error?
    
    public var fileUrl: URL?
    
    // MARK: - Init -
    
    public init(statusCode: Int, headers: RSNResponseHeaders? = nil, fileUrl: URL? = nil, error: Error? = nil) {
        self.status = RSNResponseStatus(statusCode: statusCode)
        self.headers = headers
        self.error = error
        self.fileUrl = fileUrl
    }
    
    public init(response: URLResponse? = nil, fileUrl: URL? = nil, error: Error? = nil) {
        let httpResponse = response as? HTTPURLResponse
        self.status = RSNResponseStatus(statusCode: httpResponse?.statusCode)
        self.headers = httpResponse?.allHeaderFields
        self.fileUrl = fileUrl
        self.error = error
    }
}
