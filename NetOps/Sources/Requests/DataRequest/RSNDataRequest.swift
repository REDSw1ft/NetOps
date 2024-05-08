import Foundation

public struct RSNDataRequest: RSNRequest {
    
    // MARK: - Properties -
    
    public var url: URL
    
    public var method: RSNRequestMethod
    
    public var headers: RSNRequestHeaders?
    
    public var body: RSNRequestBody?
    
    // MARK: - Init -
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        body: RSNRequestBody? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
    
    // MARK: - Init with query parameters
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        queryParameters: [RSNRequestQueryParameter],
        combiningQueryParameters: Bool = true
    ) throws {
        var urlWithQueryParameters = url
        if combiningQueryParameters {
            try urlWithQueryParameters.add(queryParameters: queryParameters)
        } else {
            try urlWithQueryParameters.set(queryParameters: queryParameters)
        }
        self.url = urlWithQueryParameters
        self.method = method
        self.headers = headers
    }
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        queryParameters: RSNRequestQueryParameter...,
        combiningQueryParameters: Bool = true
    ) throws {
        try self.init(
            url: url,
            method: method,
            headers: headers,
            queryParameters: queryParameters,
            combiningQueryParameters: combiningQueryParameters
        )
    }
    
    // MARK: - Init with encoded query parameters
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        queryParameters: Encodable,
        using encoder: RSNQueryParametersEncoder = .init(),
        combiningQueryParameters: Bool = true
    ) throws {
        var urlWithQueryParameters = url
        if combiningQueryParameters {
            try urlWithQueryParameters.addEncodableQueryParameters(queryParameters, using: encoder)
        } else {
            try urlWithQueryParameters.setEncodableQueryParameters(queryParameters, using: encoder)
        }
        self.url = urlWithQueryParameters
        self.method = method
        self.headers = headers
    }
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        queryParameters: [String: Any],
        using encoder: RSNQueryParametersEncoder = .init(),
        combiningQueryParameters: Bool = true
    ) throws {
        var urlWithQueryParameters = url
        if combiningQueryParameters {
            try urlWithQueryParameters.addEncodableQueryParameters(queryParameters, using: encoder)
        } else {
            try urlWithQueryParameters.setEncodableQueryParameters(queryParameters, using: encoder)
        }
        self.url = urlWithQueryParameters
        self.method = method
        self.headers = headers
    }
    
    // MARK: - Init with JSON body
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        jsonData: Encodable,
        using encoder: JSONEncoder = .init()
    ) throws {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = try encoder.encode(jsonData)
        if self.headers != nil {
            self.headers?["Content-Type"] = "application/json"
            self.headers?["Content-Lenght"] = "\(self.body?.count ?? 0)"
        } else {
            self.headers = [
                "Content-Type": "application/json",
                "Content-Lenght": "\(self.body?.count ?? 0)",
            ]
        }
    }
    
    // MARK: - Init with Multipart Form Data
    
    public init(
        url: URL,
        method: RSNRequestMethod,
        headers: RSNRequestHeaders? = nil,
        multipartFormData: RSNMultipartFormData
    ) throws {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = try multipartFormData.convertToData()
        if self.headers != nil {
            self.headers?["Content-Type"] = "multipart/form-data;boundary=\"\(multipartFormData.boundary)\""
            self.headers?["Content-Lenght"] = "\(self.body?.count ?? 0)"
        } else {
            self.headers = [
                "Content-Type": "multipart/form-data;boundary=\"\(multipartFormData.boundary)\"",
                "Content-Lenght": "\(self.body?.count ?? 0)",
            ]
        }
    }
}
