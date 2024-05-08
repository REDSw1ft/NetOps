import Foundation
/// [**HTTP** response status](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) codes.
/// > [**HTTP** response status](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) codes indicate whether a specific **HTTP** request has been successfully completed.
/// > Responses are grouped in five classes:
/// > - [**Informational responses** (100 – 199)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#information_responses)
/// > - [**Successful responses** (200 – 299)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#successful_responses)
/// > - [**Redirection messages** (300 – 399)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#redirection_messages)
/// > - [**Client error responses** (400 – 499)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses)
/// > - [**Server error responses** (500 – 599)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses)
/// ---
/// > The status codes listed below are defined by [**RFC 9110**](https://httpwg.org/specs/rfc9110.html#overview.of.status.codes)
public enum RSNResponseStatus {
    
    // MARK: - Cases -
    /// Unknown or unhandled status code
    case undefined(statusCode: Int)
    case informational(Informational)
    case successful(Successful)
    case redirection(Redirection)
    case clientError(ClientError)
    case serverError(ServerError)
    
    // MARK: - Aliases -
    
    /// Informational responses
    public typealias Informational = RSNResponseInformationalStatus
    /// Successful responses
    public typealias Successful = RSNResponseSuccessfulStatus
    /// Redirection messages
    public typealias Redirection = RSNResponseRedirectionStatus
    /// Client error responses
    public typealias ClientError = RSNResponseClientError
    /// Server error responses
    public typealias ServerError = RSNResponseServerError
    
    // MARK: - Initializers -
    
    public init?(statusCode: Int?) {
        guard let statusCode else {
            return nil
        }
        switch statusCode {
        case Informational.statusCodes:
            guard let status = Informational(rawValue: statusCode) else { fallthrough }
            self = .informational(status)
        case Successful.statusCodes:
            guard let status = Successful(rawValue: statusCode) else { fallthrough }
            self = .successful(status)
        case Redirection.statusCodes:
            guard let status = Redirection(rawValue: statusCode) else { fallthrough }
            self = .redirection(status)
        case ClientError.statusCodes:
            guard let status = ClientError(rawValue: statusCode) else { fallthrough }
            self = .clientError(status)
        case ServerError.statusCodes:
            guard let status = ServerError(rawValue: statusCode) else { fallthrough }
            self = .serverError(status)
        default:
            self = .undefined(statusCode: statusCode)
        }
    }
    
    // MARK: - Properites -
    
    public var statusCode: Int {
        switch self {
        case .undefined(let statusCode):
            return statusCode
        case .informational(let status):
            return status.rawValue
        case .successful(let status):
            return status.rawValue
        case .redirection(let status):
            return status.rawValue
        case .clientError(let status):
            return status.rawValue
        case .serverError(let status):
            return status.rawValue
        }
    }
    
    public var error: Error? {
        switch self {
        case .clientError(let clientError):
            return clientError
        case .serverError(let serverError):
            return serverError
        default:
            return nil
        }
    }
}
