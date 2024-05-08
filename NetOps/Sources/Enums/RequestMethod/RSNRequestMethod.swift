import Foundation
/// [**HTTP** request methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
public enum RSNRequestMethod: String, CaseIterable {
    /// The [**CONNECT**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/CONNECT) method establishes a tunnel to the server identified by the target resource.
    case connect = "CONNECT"
    /// The [**DELETE**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/DELETE) method deletes the specified resource.
    case delete = "DELETE"
    /// The [**GET**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) method requests a representation of the specified resource.
    /// Requests using [**GET**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) should only retrieve data.
    case get = "GET"
    /// The [**HEAD**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/HEAD) method asks for a response identical to a [**GET**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/GET) request, but without the response body.
    case head = "HEAD"
    /// The [**OPTIONS**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS) method describes the communication options for the target resource.
    case options = "OPTIONS"
    /// The [**PATCH**]((https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH)) method applies partial modifications to a resource.
    case patch = "PATCH"
    /// The [**POST**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) method submits an entity to the specified resource, often causing a change in state or side effects on the server.
    case post = "POST"
    /// The [**PUT**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT) method replaces all current representations of the target resource with the request payload.
    case put = "PUT"
    /// The [**TRACE**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/TRACE) method performs a message loop-back test along the path to the target resource.
    case trace = "TRACE"
}
