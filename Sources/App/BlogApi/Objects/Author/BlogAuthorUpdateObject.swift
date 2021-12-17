//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 17..
//

import Foundation

extension BlogAuthor {

    public struct Update: Codable {
        public var name: String
        public var imageKey: String?
        public var bio: String?

        public init(name: String,
                    imageKey: String?,
                    bio: String? = nil)
        {
            self.name = name
            self.imageKey = imageKey
            self.bio = bio
        }
    }
}
