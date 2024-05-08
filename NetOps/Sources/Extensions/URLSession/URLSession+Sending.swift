import Foundation

public extension URLSession {
    
    func send(_ request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) {
        let dataTask = self.dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
    
    func download(with request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) {
        let downloadTask = self.downloadTask(with: request, completionHandler: completionHandler)
        downloadTask.resume()
    }
    
    func upload(with request: RSNRequest, completionHandler: @escaping(RSNResponse) -> Void) {
        let uploadTask = self.uploadTask(with: request, completionHandler: completionHandler)
        uploadTask.resume()
    }
    
    func upload(with request: RSNRequest, from data: Data?, completionHandler: @escaping(RSNResponse) -> Void) {
        let uploadTask = self.uploadTask(with: request, from: data, completionHandler: completionHandler)
        uploadTask.resume()
    }
    
    func upload(with request: RSNRequest, fromFile url: URL, completionHandler: @escaping(RSNResponse) -> Void) {
        let uploadTask = self.uploadTask(with: request, fromFile: url, completionHandler: completionHandler)
        uploadTask.resume()
    }
}
