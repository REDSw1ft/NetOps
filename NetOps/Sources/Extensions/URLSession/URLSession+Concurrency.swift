import Foundation

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
public extension URLSession {
    
    // MARK: - Send request
    
    func send(_ request: URLRequest) async throws -> RSNResponse {
        let (data, response) = try await self.data(for: request)
        return RSNDataResponse(response: response, data: data)
    }
    
    func send(_ request: RSNRequest) async throws -> RSNResponse {
        let urlRequest = URLRequest(request)
        return try await self.send(urlRequest)
    }
    
    // MARK: - Download
    
    func download(with request: URLRequest) async throws -> RSNResponse {
        let (url, response) = try await self.download(for: request)
        return RSNDownloadResponse(response: response, fileUrl: url)
    }
    
    func download(with request: RSNRequest) async throws -> RSNResponse {
        let urlRequest = URLRequest(request)
        return try await self.download(with: urlRequest)
    }
    
    // MARK: - Upload
    
    func upload(with request: URLRequest, from data: Data) async throws -> RSNResponse {
        let (data, response) = try await self.upload(for: request, from: data)
        return RSNDataResponse(response: response, data: data)
    }
    
    func upload(with request: RSNRequest, from data: Data) async throws -> RSNResponse {
        let urlRequest = URLRequest(request)
        return try await self.upload(with: urlRequest, from: data)
    }
    
    func upload(with request: URLRequest, fromFile url: URL) async throws -> RSNResponse {
        let (data, response) = try await self.upload(for: request, fromFile: url)
        return RSNDataResponse(response: response, data: data)
    }
    
    func upload(with request: RSNRequest, fromFile url: URL) async throws -> RSNResponse {
        let urlRequest = URLRequest(request)
        return try await self.upload(with: urlRequest, fromFile: url)
    }
}
