//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 05. 04..
//

struct ValidationAbort: AbortError {

    var abort: Abort
    var message: String?
    var details: [ValidationErrorDetail]

    var reason: String { abort.reason }
    var status: HTTPStatus { abort.status }
    
    init(abort: Abort, message: String? = nil, details: [ValidationErrorDetail]) {
        self.abort = abort
        self.message = message
        self.details = details
    }
}
