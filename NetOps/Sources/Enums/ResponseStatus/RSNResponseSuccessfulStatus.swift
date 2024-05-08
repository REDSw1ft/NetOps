import Foundation
/// [**Successful responses**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#successful_responses)
public enum RSNResponseSuccessfulStatus: Int, CaseIterable, Equatable {
    /// Response status codes range
    /// > **200 - 299**
    public static let statusCodes = 200..<300
    /// The request succeeded.
    /// > The result meaning of "success" depends on the HTTP method:
    /// > * **GET**: The resource has been fetched and transmitted in the message body.
    /// > * **HEAD**: The representation headers are included in the response without any message body.
    /// > * **PUT** or **POST**: The resource describing the result of the action is transmitted in the message body.
    /// > * **TRACE**: The message body contains the request message as received by the server.
    /// ---
    /// > HTTP status code [**200**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200)
    case okay = 200
    /// The request succeeded, and a new resource was created as a result. This is typically the response sent after **POST** requests, or some **PUT** requests.
    /// > HTTP status code [**201**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/201)
    case created
    /// The request has been received but not yet acted upon. It is noncommittal, since there is no way in HTTP to later send an asynchronous response indicating the outcome of the request. It is intended for cases where another process or server handles the request, or for batch processing.
    /// > HTTP status code [**202**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/202)
    case accepted
    /// This response code means the returned metadata is not exactly the same as is available from the origin server, but is collected from a local or a third-party copy. This is mostly used for mirrors or backups of another resource. Except for that specific case, the 200 OK response is preferred to this status.
    /// > HTTP status code [**203**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/203)
    case nonAuthoritativeInformation
    /// There is no content to send for this request, but the headers may be useful. The user agent may update its cached headers for this resource with the new ones.
    /// > HTTP status code [**204**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/204)
    case noContent
    /// Tells the user agent to reset the document which sent this request.
    /// > HTTP status code [**205**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/205)
    case resetContent
    /// This response code is used when the [**Range**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range) header is sent from the client to request only part of a resource.
    /// > HTTP status code [**206**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/206)
    case partialContent
    /// Conveys information about multiple resources, for situations where multiple status codes might be appropriate.
    /// > HTTP status code [**207**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/207)
    case multiStatus
    /// Used inside a **\<dav:propstat\>** response element to avoid repeatedly enumerating the internal members of multiple bindings to the same collection.
    /// > HTTP status code [**208**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/208)
    case alreadyReported
    /// The server has fulfilled a **GET** request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
    /// > HTTP status code [**226**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/226)
    case usedIM = 226
}
