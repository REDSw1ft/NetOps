import Foundation

extension RSNResponseStatus: Equatable {
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
    
    // MARK: - Int -
    
    public static func == (lhs: RSNResponseStatus, rhs: Int) -> Bool {
        return lhs.statusCode == rhs
    }
    
    public static func == (lhs: Int, rhs: RSNResponseStatus) -> Bool {
        return lhs == rhs.statusCode
    }
    
    // MARK: - Informational responses -
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus.Informational) -> Bool {
        return lhs.statusCode == rhs.rawValue
    }
    
    public static func == (lhs: RSNResponseStatus.Informational, rhs: RSNResponseStatus) -> Bool {
        return lhs.rawValue == rhs.statusCode
    }
    
    // MARK: - Successful responses -
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus.Successful) -> Bool {
        return lhs.statusCode == rhs.rawValue
    }
    
    public static func == (lhs: RSNResponseStatus.Successful, rhs: RSNResponseStatus) -> Bool {
        return lhs.rawValue == rhs.statusCode
    }
    
    // MARK: - Redirection messages -
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus.Redirection) -> Bool {
        return lhs.statusCode == rhs.rawValue
    }
    
    public static func == (lhs: RSNResponseStatus.Redirection, rhs: RSNResponseStatus) -> Bool {
        return lhs.rawValue == rhs.statusCode
    }
    
    // MARK: - Client error responses -
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus.ClientError) -> Bool {
        return lhs.statusCode == rhs.rawValue
    }
    
    public static func == (lhs: RSNResponseStatus.ClientError, rhs: RSNResponseStatus) -> Bool {
        return lhs.rawValue == rhs.statusCode
    }
    
    // MARK: - Server error responses -
    
    public static func == (lhs: RSNResponseStatus, rhs: RSNResponseStatus.ServerError) -> Bool {
        return lhs.statusCode == rhs.rawValue
    }
    
    public static func == (lhs: RSNResponseStatus.ServerError, rhs: RSNResponseStatus) -> Bool {
        return lhs.rawValue == rhs.statusCode
    }
}
