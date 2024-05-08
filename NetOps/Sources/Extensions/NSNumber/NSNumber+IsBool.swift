import Foundation

extension NSNumber {
    
    var isBool: Bool {
        return String(cString: self.objCType) == "c"
    }
}
