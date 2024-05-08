import Foundation
/// [**Server error responses**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses)
public enum RSNResponseServerError: Int, CaseIterable, Error, Equatable {
    /// Response status codes range
    /// > **500 - 599**
    public static let statusCodes = 500..<600
    /// The server has encountered a situation it does not know how to handle.
    /// > HTTP status code [**500**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500)
    case internalServerError = 500
    /// The request method is not supported by the server and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are **GET** and **HEAD**.
    /// > HTTP status code [**501**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/501)
    case notImplemented
    /// This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.
    /// > HTTP status code [**502**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/502)
    case badGateway
    /// The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded. Note that together with this response, a user-friendly page explaining the problem should be sent. This response should be used for temporary conditions and the **Retry-After** HTTP header should, if possible, contain the estimated time before the recovery of the service. The webmaster must also take care about the caching-related headers that are sent along with this response, as these temporary condition responses should usually not be cached.
    /// > HTTP status code [**503**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/503)
    case serviceUnavailable
    /// This error response is given when the server is acting as a gateway and cannot get a response in time.
    /// > HTTP status code [**504**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/504)
    case gatewayTimeout
    /// The HTTP version used in the request is not supported by the server.
    /// > HTTP status code [**505**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/505)
    case httpVersionNotSupported
    /// The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process.
    /// > HTTP status code [**506**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/506)
    case variantAlsoNegotiates
    /// The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request.
    /// > HTTP status code [**507**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/507)
    case insufficientStorage
    /// The server detected an infinite loop while processing the request.
    /// > HTTP status code [**508**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/508)
    case loopDetected
    /// Further extensions to the request are required for the server to fulfill it.
    /// > HTTP status code [**510**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/510)
    case notExtended = 510
    /// Indicates that the client needs to authenticate to gain network access.
    /// > HTTP status code [**511**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/511)
    case networkAuthenticationRequired
}
