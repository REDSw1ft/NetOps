import Foundation

public extension URLSession {
    
    func dataTask(with request: URLRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionDataTask {
        let task = self.dataTask(with: request) { data, response, error in
            completionHandler(RSNDataResponse(response: response, data: data, error: error))
        }
        return task
    }
    
    func dataTask(with request: RSNRequest, completionHandler: @escaping @Sendable(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let urlRequest = URLRequest(request)
        let task = self.dataTask(with: urlRequest, completionHandler: completionHandler)
        return task
    }
    
    func dataTask(with request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionDataTask {
        let urlRequest = URLRequest(request)
        let task = self.dataTask(with: urlRequest, completionHandler: completionHandler)
        return task
    }
}
