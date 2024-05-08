import Foundation

/// Request body data with `Content-Type: multipart/form-data;`
/// - Use method `convertToData()` for prepare Request body data
/// - Boundary in header **Content-Type** and boundary in body must be equal (see example).
/// > Properties:
/// > - **boundary**: arbitrary string for request body markup.
/// >   **Default value:** random lowercased GUID (UUID v4) string.
/// > - **items**: Array of multipart form data fields.
/// >   **Default value:** empty array.
/// > - **dataEncoding**: instance of `String.Encoding`.
/// >   Using for encode `String` to `Data`.
/// >   **Default value:** `UTF-8`.
/// ---
/// - [Example](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST):
/// ```
/// --- Request Data ---
/// POST /test HTTP/1.1
/// -- Headers --
///
/// Host: foo.example
/// Content-Type: multipart/form-data;boundary="boundary"
///
/// -- Body --
///
/// --boundary
/// Content-Disposition: form-data; name="field1"
///
/// value1
/// --boundary
/// Content-Disposition: form-data; name="field2"; filename="example.txt"
///
/// value2
/// --boundary--
///
/// ```
public struct RSNMultipartFormData {
    
    // MARK: - Properties -
    
    var boundary: String
    var items: [RSNMultipartFormDataItem] = []
    var dataEncoding: String.Encoding
    
    // MARK: - Init -
    
    public init(boundary: String = UUID().uuidString.lowercased(), items: [RSNMultipartFormDataItem] = [], dataEncoding: String.Encoding = .utf8) {
        self.boundary = boundary
        self.items = items
        self.dataEncoding = dataEncoding
    }
    
    // MARK: - Functions -
    
    /// Convert Multipart data items to request body data
    /// > Returns: Request body data (multipart form) if items aren't empty.
    /// ---
    /// - Throws: `RSNMultipartDataError.noDataFields` if **items** array is empty else any `Error` that occurs.
    /// ---
    /// Example:
    /// ````
    ///
    /// --boundary
    /// Content-Disposition: form-data; name="field1"
    ///
    /// value1
    /// --boundary
    /// Content-Disposition: form-data; name="field2"; filename="example.txt"
    ///
    /// value2
    /// --boundary--
    ///
    /// ````
    public func convertToData() throws -> Data {
        guard !self.items.isEmpty else { throw RSNMultipartDataError.noDataFields }
        var data = Data()
        for item in items {
            let itemData = try self.prepareData(for: item)
            data.append(itemData)
        }
        data.append("--\(boundary)--\r\n", encoding: self.dataEncoding)
        return data
    }
    
    // MARK: - Private
    
    private func prepareData(for item: RSNMultipartFormDataItem) throws -> Data {
        var data = Data()
        data.append("--\(self.boundary)\r\n", encoding: self.dataEncoding)
        switch item {
        case let .text(fieldName, value, contentType, contentTransferEncoding):
            data.append(
                self.prepareFieldHeaderData(
                    fieldName: fieldName,
                    contentType: contentType,
                    contentTransferEncoding: contentTransferEncoding
                )
            )
            data.append("\(value)\r\n",  encoding: self.dataEncoding)
        case let .data(fieldName, value, contentType, contentTransferEncoding):
            data.append(
                self.prepareFieldHeaderData(
                    fieldName: fieldName,
                    contentType: contentType,
                    contentTransferEncoding: contentTransferEncoding
                )
            )
            data.append(value)
            data.append("\r\n",  encoding: self.dataEncoding)
        case let .file(fieldName, fileName, value, contentType, contentTransferEncoding):
            let content = try Data(contentsOf: value)
            return try self.prepareData(
                for: .fileData(
                    fieldName: fieldName,
                    fileName: fileName,
                    value: content,
                    contentType: contentType,
                    contentTransferEncoding: contentTransferEncoding
                )
            )
        case let .fileData(fieldName, fileName, value, contentType, contentTransferEncoding):
            data.append(
                self.prepareFieldHeaderData(
                    fieldName: fieldName,
                    fileName: fileName,
                    contentType: contentType,
                    contentTransferEncoding: contentTransferEncoding
                )
            )
            data.append(value)
            data.append("\r\n",  encoding: self.dataEncoding)
        }
        return data
    }
    
    private func prepareFieldHeaderData(fieldName: String, fileName: String? = nil, contentType: String? = nil, contentTransferEncoding: String? = nil) -> Data {
        var data = Data()
        data.append("Content-Disposition: form-data; name=\"\(fieldName)\"",  encoding: self.dataEncoding)
        if let fileName {
            data.append("; filename=\"\(fileName)\"", encoding: self.dataEncoding)
        }
        data.append("\r\n",  encoding: self.dataEncoding)
        if let contentType {
            data.append("Content-Type: \(contentType)\r\n",  encoding: self.dataEncoding)
        }
        if let contentTransferEncoding {
            data.append("Content-Transfer-Encoding: \(contentTransferEncoding)\r\n",  encoding: self.dataEncoding)
        }
        data.append("\r\n",  encoding: self.dataEncoding)
        return data
    }
    
}
