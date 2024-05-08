import Foundation
/// [**Informational responses**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#information_responses)
public enum RSNResponseInformationalStatus: Int, CaseIterable, Equatable {
    /// Response status codes range
    /// > **100 - 199**
    public static let statusCodes = 100..<200
    /// This interim response indicates that the client should continue the request or ignore the response if the request is already finished.
    /// > HTTP status code [**100**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/100)
    case `continue` = 100
    /// This code is sent in response to an [**Upgrade**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Upgrade) request header from the client and indicates the protocol the server is switching to.
    /// > HTTP status code [**101**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/101)
    case switchingProtocols
    /// This code indicates that the server has received and is processing the request, but no response is available yet.
    /// > HTTP status code [**102**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/102)
    case processing
    /// This status code is primarily intended to be used with the [**Link**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Link) header, letting the user agent start [**preloading**](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel/preload) resources while the server prepares a response or [**preconnect**](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel/preconnect) to an origin from which the page will need resources.
    /// > HTTP status code [**103**](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/103)
    case earlyHints
}
