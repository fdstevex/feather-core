//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 11. 24..
//

import Vapor
import Fluent

final class UserPermissionModel: FeatherModel {
    typealias Module = UserModule

    struct FieldKeys {
        struct v1 {
            static var namespace: FieldKey { "namespace" }
            static var context: FieldKey { "context" }
            static var action: FieldKey { "action" }
            static var name: FieldKey { "name" }
            static var notes: FieldKey { "notes" }
        }
    }

    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.namespace) var namespace: String
    @Field(key: FieldKeys.v1.context) var context: String
    @Field(key: FieldKeys.v1.action) var action: String
    @Field(key: FieldKeys.v1.name) var name: String
    @Field(key: FieldKeys.v1.notes) var notes: String?
    @Siblings(through: UserRolePermissionModel.self, from: \.$permission, to: \.$role) var roles: [UserRoleModel]
    
    init() { }

    init(id: UUID? = nil,
         namespace: String,
         context: String,
         action: String,
         name: String,
         notes: String? = nil) {
        self.id = id
        self.namespace = namespace
        self.context = context
        self.action = action
        self.name = name
        self.notes = notes
    }
}


extension UserPermissionModel {
    
    var featherPermission: FeatherPermission {
        .init(namespace: namespace, context: context, action: .init(stringLiteral: action))
    }
}
