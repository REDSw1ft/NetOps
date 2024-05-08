import Foundation

public extension RSNQueryParametersEncoder {
    
    enum BooleanEncodingStrategy {
        case numeric
        case literal
        
        // MARK: - Functions -
        
        func encode(value: Bool) -> String {
            switch self {
            case .numeric:
                return value ? "1" : "0"
            case .literal:
                return "\(value)"
            }
        }
    }

}
