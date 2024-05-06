//
//  ErrorWrapper.swift
//  ScrumbDinger
//
//  Created by Darian Mitchell  on 2024/5/6.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}


extension ErrorWrapper {
    
}
