import Foundation

open class RSNQueryParametersEncoder {
    
    // MARK: - Properties -
    
    public var arrayEncodingStrategy: ArrayEncodingStrategy = .noBrackets
    public var boolEncodingStrategy: BooleanEncodingStrategy = .literal
    
    // MARK: - Init -
    
    public init(arrayEncodingStrategy: ArrayEncodingStrategy = .noBrackets, boolEncodingStrategy: BooleanEncodingStrategy = .literal) {
        self.arrayEncodingStrategy = arrayEncodingStrategy
        self.boolEncodingStrategy = boolEncodingStrategy
    }
    
    // MARK: - Functions -
    
    /// Encode to query parameters
    /// - Parameters:
    ///    - parametersToEncode: Dictionary with `String` keys and `Any` values.
    /// > Returns: Array of encoded query parameters (`RSNRequestQueryParameter`).
    /// ---
    /// - Throws: Any `Error` that occurs.
    public func encode(_ parametersToEncode: [String: Any]) throws -> [RSNRequestQueryParameter] {
        var params: [RSNRequestQueryParameter] = []
        for (key, value) in parametersToEncode {
            switch value {
            case let array as [Any]:
                for (index, value) in array.enumerated() {
                    let encodedKey = self.arrayEncodingStrategy.encode(key: key, at: index)
                    let encodedValue = encode(value: value)
                    params.append(RSNRequestQueryParameter(name: encodedKey, value: encodedValue))
                }
            case let dictionary as [String: Any]:
                for (nestedKey, value) in dictionary {
                    let encodedValue = encode(value: value)
                    params.append(RSNRequestQueryParameter(name: "\(key)[\(nestedKey)]", value: encodedValue))
                }
            default:
                let encodedValue = encode(value: value)
                params.append(RSNRequestQueryParameter(name: key, value: encodedValue))
            }
        }
        return params
    }
    
    /// Encode to query parameters
    /// - Parameters:
    ///    - parametersToEncode: Any instance conforms `Encodable` protocol.
    /// > Returns: Array of encoded query parameters (`RSNRequestQueryParameter`).
    /// ---
    /// - Throws: Any `Error` that occurs.
    public func encode(_ parametersToEncode: Encodable) throws -> [RSNRequestQueryParameter] {
        let converted = try parametersToEncode.convertToDictionary()
        return try self.encode(converted)
    }
    
    // MARK: - Private
    
    /// Encode any value to stringify query parameter value.
    private func encode(value: Any) -> String {
        switch value {
        case let number as NSNumber:
            return number.isBool ? self.encodeBool(value: number as! Bool) : "\(value)"
        case let bool as Bool:
            return self.encodeBool(value: bool)
        default:
            return "\(value)"
        }
    }
    /// Encode boolean with current strategy
    private func encodeBool(value: Bool) -> String {
        return self.boolEncodingStrategy.encode(value: value)
    }
    
}
