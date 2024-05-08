import Foundation

extension RSNRequestMethod: CustomStringConvertible {
    
    public var description: String {
        return "Request method \"\(self.rawValue.uppercased())\""
    }

}
