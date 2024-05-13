import Foundation

public extension URLSession {
    
    func downloadTask(with request: URLRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionDownloadTask {
        let task = self.downloadTask(with: request) { url, response, error in
            do {
                let response = try RSNDownloadResponse(response: response, fileUrl: url, error: error)
                completionHandler(response)
            } catch {
                completionHandler(RSNDataResponse(error: error))
            }
        }
        return task
    }
    
    func downloadTask(with request: RSNRequest, completionHandler: @escaping @Sendable(URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask {
        let urlRequest = URLRequest(request)
        let task = self.downloadTask(with: urlRequest, completionHandler: completionHandler)
        return task
    }
    
    func downloadTask(with request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) -> URLSessionDownloadTask {
        let urlRequest = URLRequest(request)
        let task = self.downloadTask(with: urlRequest, completionHandler: completionHandler)
        return task
    }
}
