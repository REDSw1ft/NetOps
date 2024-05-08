import Foundation

public extension RSNQueryParametersEncoder {
    
    enum ArrayEncodingStrategy {
        case brackets
        case noBrackets
        case indexInBrackets
        
        // MARK: - Functions -
        
        func encode(key: String, at index: Int) -> String {
            switch self {
            case .brackets:
                return "\(key)[]"
            case .noBrackets:
                return key
            case .indexInBrackets:
                return "\(key)[\(index)]"
            }
        }
    }

}
