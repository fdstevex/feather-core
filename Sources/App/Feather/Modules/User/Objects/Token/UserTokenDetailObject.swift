//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 06..
//

import Foundation

extension UserToken {

    public struct Detail: Codable {
        public let id: UUID
        public let value: String
        public let userId: UUID

        public init(id: UUID, value: String, userId: UUID) {
            self.id = id
            self.value = value
            self.userId = userId
        }
    }
}
