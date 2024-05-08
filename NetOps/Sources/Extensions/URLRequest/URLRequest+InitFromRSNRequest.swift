import Foundation

public extension URLRequest {
    
    init(_ request: RSNRequest, cachePolicy: CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60) {
        self.init(url: request.url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        self.httpMethod = request.method.rawValue
        self.allHTTPHeaderFields = request.headers
        self.httpBody = request.body
    }
    
}
