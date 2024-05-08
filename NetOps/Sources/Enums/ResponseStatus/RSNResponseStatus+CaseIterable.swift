import Foundation

extension RSNResponseStatus: CaseIterable {
    
    public static var allCases: [RSNResponseStatus] {
        var cases: [RSNResponseStatus] = []
        cases.append(contentsOf: Informational.allCases.map { .informational($0) } )
        cases.append(contentsOf: Successful.allCases.map { .successful($0) } )
        cases.append(contentsOf: Redirection.allCases.map { .redirection($0) } )
        cases.append(contentsOf: ClientError.allCases.map { .clientError($0) } )
        cases.append(contentsOf: ServerError.allCases.map { .serverError($0) } )
        return cases
    }

}
