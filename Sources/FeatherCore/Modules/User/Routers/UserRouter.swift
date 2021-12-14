//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 11. 23..
//

import Vapor

struct UserRouter: FeatherRouter {
    
    let authController = UserAuthController()
    let accountController = UserAccountAdminController()
    let roleController = UserRoleAdminController()
    let permissionController = UserPermissionAdminController()

    func boot(_ app: Application) throws {
        app.routes.grouped(UserAccountSessionAuthenticator())
            .get(Feather.config.paths.login.pathComponent, use: authController.loginView)
        app.routes.grouped(UserAccountCredentialsAuthenticator())
            .post(Feather.config.paths.login.pathComponent, use: authController.login)
        app.routes.grouped(UserAccountSessionAuthenticator())
            .get(Feather.config.paths.logout.pathComponent, use: authController.logout)
    }
    
    func adminRoutesHook(args: HookArguments) {
        accountController.setupAdminRoutes(args.routes)
        roleController.setupAdminRoutes(args.routes)
        permissionController.setupAdminRoutes(args.routes)
    }

    func adminApiRoutesHook(args: HookArguments) {
        accountController.setupAdminApiRoutes(args.routes)
        roleController.setupAdminApiRoutes(args.routes)
        permissionController.setupAdminApiRoutes(args.routes)
    }
}