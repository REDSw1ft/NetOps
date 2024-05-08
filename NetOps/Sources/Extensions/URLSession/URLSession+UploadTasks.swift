import Foundation

public extension URLSession {
    
    func uploadTask(with request: URLRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let task = self.uploadTask(with: request, from: request.httpBody) { data, response, error in
            completionHandler(RSNDataResponse(response: response, data: data, error: error))
        }
        return task
    }
    
    func uploadTask(with request: RSNRequest, completionHandler: @escaping @Sendable(Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, from: request.body, completionHandler: completionHandler)
        return task
    }
    
    func uploadTask(with request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, completionHandler: completionHandler)
        return task
    }
    
    func uploadTask(with request: URLRequest, from data: Data?, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let task = self.uploadTask(with: request, from: data) { data, response, error in
            completionHandler(RSNDataResponse(response: response, data: data, error: error))
        }
        return task
    }
    
    func uploadTask(with request: RSNRequest, from data: Data?, completionHandler: @escaping @Sendable(Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, from: data, completionHandler: completionHandler)
        return task
    }
    
    func uploadTask(with request: RSNRequest, from data: Data?, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, from: data, completionHandler: completionHandler)
        return task
    }
    
    func uploadTask(with request: URLRequest, fromFile url: URL, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let task = self.uploadTask(with: request, fromFile: url) { data, response, error in
            completionHandler(RSNDataResponse(response: response, data: data, error: error))
        }
        return task
    }
    
    func uploadTask(with request: RSNRequest, fromFile url: URL, completionHandler: @escaping @Sendable(Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, fromFile: url, completionHandler: completionHandler)
        return task
    }
    
    func uploadTask(with request: RSNRequest, fromFile url: URL, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionUploadTask {
        let urlRequest = URLRequest(request)
        let task = self.uploadTask(with: urlRequest, fromFile: url, completionHandler: completionHandler)
        return task
    }
}
