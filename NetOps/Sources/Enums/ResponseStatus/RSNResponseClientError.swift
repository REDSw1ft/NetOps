import Foundation
/// [**Client error responses**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses)
public enum RSNResponseClientError: Int, CaseIterable, Error, Equatable {
    /// Response status codes range
    /// > **400 - 499**
    public static let statusCodes = 400..<500
    /// The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).
    /// > HTTP status code [**400**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400)
    case badRequest = 400
    /// Although the HTTP standard specifies "unauthorized", semantically this response means "unauthenticated". That is, the client must authenticate itself to get the requested response.
    /// > HTTP status code [**401**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401)
    case unauthorized
    /// This response code is reserved for future use. The initial aim for creating this code was using it for digital payment systems, however this status code is used very rarely and no standard convention exists.
    /// > HTTP status code [**402**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/402)
    case paymentRequired
    /// The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource. Unlike **401 Unauthorized**, the client's identity is known to the server.
    /// > HTTP status code [**403**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403)
    case forbidden
    /// The server cannot find the requested resource. In the browser, this means the URL is not recognized. In an API, this can also mean that the endpoint is valid but the resource itself does not exist. Servers may also send this response instead of **403 Forbidden** to hide the existence of a resource from an unauthorized client. This response code is probably the most well known due to its frequent occurrence on the web.
    /// > HTTP status code [**404**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404)
    case notFound
    /// The request method is known by the server but is not supported by the target resource. For example, an API may not allow calling **DELETE** to remove a resource.
    /// > HTTP status code [**405**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/405)
    case methodNotAllowed
    /// This response is sent when the web server, after performing [**server-driven content negotiation**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation#server-driven_negotiation), doesn't find any content that conforms to the criteria given by the user agent.
    /// > HTTP status code [**406**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/406)
    case notAcceptable
    /// This is similar to **401 Unauthorized** but authentication is needed to be done by a proxy.
    /// > HTTP status code [**407**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/407)
    case proxyAuthenticationRequired
    /// This response is sent on an idle connection by some servers, even without any previous request by the client. It means that the server would like to shut down this unused connection. This response is used much more since some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection mechanisms to speed up surfing. Also note that some servers merely shut down the connection without sending this message.
    /// > HTTP status code [**408**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408)
    case requestTimeout
    /// This response is sent when a request conflicts with the current state of the server.
    /// > HTTP status code [**409**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409)
    case conflict
    /// This response is sent when the requested content has been permanently deleted from server, with no forwarding address. Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be used for "limited-time, promotional services". APIs should not feel compelled to indicate resources that have been deleted with this status code.
    /// > HTTP status code [**410**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/410)
    case gone
    /// Server rejected the request because the **Content-Length** header field is not defined and the server requires it.
    /// > HTTP status code [**411**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/411)
    case lengthRequired
    /// The client has indicated preconditions in its headers which the server does not meet.
    /// > HTTP status code [**412**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/412)
    case preconditionFailed
    /// Request entity is larger than limits defined by server. The server might close the connection or return an **Retry-After** header field.
    /// > HTTP status code [**413**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/413)
    case payloadTooLarge
    /// The URI requested by the client is longer than the server is willing to interpret.
    /// > HTTP status code [**414**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/414)
    case uriTooLong
    /// The media format of the requested data is not supported by the server, so the server is rejecting the request.
    /// > HTTP status code [**415**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/415)
    case unsupportedMediaType
    /// The range specified by the **Range** header field in the request cannot be fulfilled. It's possible that the range is outside the size of the target URI's data.
    /// > HTTP status code [**416**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/416)
    case rangeNotSatisfiable
    /// This response code means the expectation indicated by the **Expect** request header field cannot be met by the server.
    /// > HTTP status code [**417**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/417)
    case expectationFailed
    /// The server refuses the attempt to brew coffee with a teapot.
    /// ---
    /// It's a joke.
    /// ---
    /// > HTTP status code [**418**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400)
    case teapot
    /// The request was directed at a server that is not able to produce a response. This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI.
    /// > HTTP status code [**421**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/421)
    case misdirectedRequest = 421
    /// The request was well-formed but was unable to be followed due to semantic errors.
    /// > HTTP status code [**422**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422)
    case unprocessableContent
    /// The resource that is being accessed is locked.
    /// > HTTP status code [**423**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/423)
    case locked
    /// The request failed due to failure of a previous request.
    /// > HTTP status code [**424**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/424)
    case failedDependency
    /// Indicates that the server is unwilling to risk processing a request that might be replayed.
    /// > HTTP status code [**425**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/425)
    case tooEarly
    /// The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol. The server sends an [**Upgrade**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade) header in a 426 response to indicate the required protocol(s).
    /// > HTTP status code [**426**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/426)
    case upgradeRequired
    /// The origin server requires the request to be conditional. This response is intended to prevent the 'lost update' problem, where a client **GETs** a resource's state, modifies it and **PUT**s it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict.
    /// > HTTP status code [**428**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/428)
    case preconditionRequired = 428
    /// The user has sent too many requests in a given amount of time ("rate limiting").
    /// > HTTP status code [**429**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429)
    case tooManyRequests
    /// The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields.
    /// > HTTP status code [**431**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/431)
    case requestHeaderFieldsTooLarge = 431
    /// The user agent requested a resource that cannot legally be provided, such as a web page censored by a government.
    /// > HTTP status code [**451**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/451)
    case unavailableForLegalReasons = 451
}
