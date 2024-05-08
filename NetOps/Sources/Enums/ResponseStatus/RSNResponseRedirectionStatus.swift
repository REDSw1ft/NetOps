import Foundation
/// [**Redirection messages**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#redirection_messages)
public enum RSNResponseRedirectionStatus: Int, CaseIterable, Equatable {
    /// Response status codes range
    /// > **300 - 399**
    public static let statusCodes = 300..<400
    /// The request has more than one possible response. The user agent or user should choose one of them. (There is no standardized way of choosing one of the responses, but HTML links to the possibilities are recommended so the user can pick.)
    /// > HTTP status code [**300**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/300)
    case multipleChoices = 300
    /// The URL of the requested resource has been changed permanently. The new URL is given in the response.
    /// > HTTP status code [**301**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/301)
    case movedPermanently
    /// This response code means that the URI of requested resource has been changed temporarily. Further changes in the URI might be made in the future. Therefore, this same URI should be used by the client in future requests.
    /// > HTTP status code [**302**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/302)
    case found
    /// The server sent this response to direct the client to get the requested resource at another URI with a **GET** request.
    /// > HTTP status code [**303**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/303)
    case seeOther
    /// This is used for caching purposes. It tells the client that the response has not been modified, so the client can continue to use the same cached version of the response.
    /// > HTTP status code [**304**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/304)
    case notModified
    /// Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy. It has been deprecated due to security concerns regarding in-band configuration of a proxy.
    /// > HTTP status code [**305**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/305)
    case useProxy
    /// This response code is no longer used; it is just reserved. It was used in a previous version of the HTTP/1.1 specification.
    /// > HTTP status code [**306**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/306)
    case unused
    /// The server sends this response to direct the client to get the requested resource at another URI with the same method that was used in the prior request. This has the same semantics as the 302 Found HTTP response code, with the exception that the user agent must not change the HTTP method used: if a **POST** was used in the first request, a **POST** must be used in the second request.
    /// > HTTP status code [**307**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/307)
    case temporaryRedirect
    /// This means that the resource is now permanently located at another URI, specified by the Location: HTTP Response header. This has the same semantics as the **301 Moved Permanently** HTTP response code, with the exception that the user agent must not change the HTTP method used: if a **POST** was used in the first request, a **POST** must be used in the second request.
    /// > HTTP status code [**308**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/308)
    case permanentRedirect
}
