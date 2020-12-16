//
//  main.swift
//  Feather
//
//  Created by Tibor Bodecs on 2019. 12. 17..
//

import FeatherCore
import FluentSQLiteDriver
import LiquidLocalDriver


var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let feather = try Feather(env: env)
defer { feather.stop() }

try feather.configure(database: .sqlite(.file("db.sqlite")),
                      databaseId: .sqlite,
                      fileStorage: .local(publicUrl: Application.baseUrl, publicPath: Application.Paths.public, workDirectory: "assets"),
                      fileStorageId: .local,
                      modules: [])

if feather.app.isDebug {
    try feather.reset()
}
try feather.start()
