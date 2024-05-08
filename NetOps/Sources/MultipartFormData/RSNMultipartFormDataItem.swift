import Foundation

public enum RSNMultipartFormDataItem {
    case text(fieldName: String, value: String, contentType: String? = nil, contentTransferEncoding: String? = nil)
    case data(fieldName: String, value: Data, contentType: String? = nil, contentTransferEncoding: String? = nil)
    case fileData(fieldName: String, fileName: String, value: Data, contentType: String? = nil, contentTransferEncoding: String? = nil)
    case file(fieldName: String, fileName: String, value: URL, contentType: String? = nil, contentTransferEncoding: String? = nil)
}
