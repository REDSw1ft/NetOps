import Foundation

public extension URL {
    
    // MARK: - Helpers
    
    /// Get `URLComponents` from current `URL`.
    /// - Parameters:
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// > Ruturns:  `URLComponents` from current `URL`.
    /// ---
    /// - Throws: `RSNURLError.componentsNotInitiated` if componennts not initialized from current `URL`.
    func getComponents(resolvingAgainstBaseURL: Bool = true) throws -> URLComponents {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL) else {
            throw RSNURLError.componentsNotInitiated
        }
        return components
    }
    /// Update current `URL` from `URLComponents`.
    /// - Parameters:
    ///    - components: instance of `URLComponents`.
    /// - Throws: `RSNURLError.notInitiatedFromComponents` if new `URL` not initialized from components.
    mutating func update(from components: URLComponents) throws {
        guard let urlFromComponents = components.url else {
            throw RSNURLError.notInitiatedFromComponents
        }
        self = urlFromComponents
    }
    
    // MARK: - Get query parameters
    
    /// Get query parameters from current `URL` if exist.
    /// - Parameters:
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// > Ruturns: Array of query parameters (`RSNRequestQueryParameter`) or `nil`.
    /// - Example:
    /// ```
    /// "https://example.com?foo=1&bar=baz" -> [
    ///     RSNRequestQueryParameter(name: "foo", value: "1"),
    ///     RSNRequestQueryParameter(name: "bar", value: "baz")
    /// ]
    /// ```
    /// ---
    /// - Throws: Any `Error` that occurs.
    func getQueryParameters(resolvingAgainstBaseURL: Bool = true) throws -> [RSNRequestQueryParameter]? {
        return try self.getComponents(resolvingAgainstBaseURL: resolvingAgainstBaseURL).queryItems
    }
    
    // MARK: - Adding query parameters
    
    /// Add query parameters to current `URL`.
    /// - Parameters:
    ///    - queryParameters: Array of query parameters (`RSNRequestQueryParameter`).
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func add(queryParameters: [RSNRequestQueryParameter], resolvingAgainstBaseURL: Bool = true) throws {
        var components = try self.getComponents(resolvingAgainstBaseURL: resolvingAgainstBaseURL)
        if components.queryItems == nil {
            components.queryItems = queryParameters
        } else {
            components.queryItems?.append(contentsOf: queryParameters)
        }
        try self.update(from: components)
    }
    /// Add query parameters to current `URL`.
    /// - Parameters:
    ///    - queryParameters: [**variadic**](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Variadic-Parameters) array of query parameters (`RSNRequestQueryParameter`).
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func addQueryParameters(_ queryParameters: RSNRequestQueryParameter..., resolvingAgainstBaseURL: Bool = true) throws {
        try self.add(queryParameters: queryParameters, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
    }
    /// Encode query parameters and add to current `URL`.
    /// - Parameters:
    ///    - queryParameters: Any instance conforms `Encodable` protocol.
    ///    - encoder: instance of `QueryParametersEncoder` class.
    ///        - Initialized by default.
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func addEncodableQueryParameters(_ queryParameters: Encodable, using encoder: RSNQueryParametersEncoder = .init(), resolvingAgainstBaseURL: Bool = true) throws {
        let encodedQueryParameters = try encoder.encode(queryParameters)
        try self.add(queryParameters: encodedQueryParameters, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
    }
    
    // MARK: - Set query parameters
    
    /// Set query parameters to current `URL`. Previos query parameters will be deleted.
    /// - Parameters:
    ///    - queryParameters: Array of query parameters (`RSNRequestQueryParameter`).
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func set(queryParameters: [RSNRequestQueryParameter], resolvingAgainstBaseURL: Bool = true) throws {
        var components = try self.getComponents(resolvingAgainstBaseURL: resolvingAgainstBaseURL)
        components.queryItems = queryParameters
        try self.update(from: components)
    }
    /// Set query parameters to current `URL`. Previos query parameters will be deleted.
    /// - Parameters:
    ///    - queryParameters: [**variadic**](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Variadic-Parameters) array of query parameters (`RSNRequestQueryParameter`).
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func setQueryParameters(_ queryParameters: RSNRequestQueryParameter..., resolvingAgainstBaseURL: Bool = true) throws {
        try self.set(queryParameters: queryParameters, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
    }
    /// Encode query parameters and set query parameters to current `URL`. Previos query parameters will be deleted.
    /// - Parameters:
    ///    - queryParameters: Any instance conforms `Encodable` protocol.
    ///    - encoder: instance of `QueryParametersEncoder` class.
    ///         - Initialized by default.
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///        - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///        - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func setEncodableQueryParameters(_ queryParameters: Encodable, using encoder: RSNQueryParametersEncoder = .init(), resolvingAgainstBaseURL: Bool = true) throws {
        let encodedQueryParameters = try encoder.encode(queryParameters)
        try self.set(queryParameters: encodedQueryParameters, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
    }
    
    // MARK: - Remove query parameters
    
    /// Remove all query parameters from current `URL`.
    /// - Parameters:
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func removeAllQueryParameters(resolvingAgainstBaseURL: Bool = true) throws {
        var components = try self.getComponents(resolvingAgainstBaseURL: resolvingAgainstBaseURL)
        components.queryItems = nil
        try self.update(from: components)
    }
    /// Remove all query parameters that satisfies the condition by closure from current `URL`.
    /// - Parameters:
    ///    - resolvingAgainstBaseURL: from `URLComponents(url:resolvingAgainstBaseURL:)` initializer.
    ///       - If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    ///       - Default value: `true`
    /// - Throws: Any `Error` that occurs.
    mutating func removeQueryParameters(where shouldBeRemoved: (RSNRequestQueryParameter) -> Bool, resolvingAgainstBaseURL: Bool = true) throws {
        var components = try self.getComponents(resolvingAgainstBaseURL: resolvingAgainstBaseURL)
        components.queryItems?.removeAll(where: shouldBeRemoved)
        try self.update(from: components)
    }
}
