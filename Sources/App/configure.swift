import FluentSQLite
import Fluent
import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {


    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    try services.register(LeafProvider())
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)

    let directoryConfig = DirectoryConfig.detect()
    services.register(directoryConfig)

    try services.register(FluentSQLiteProvider())

    var databaseConfig = DatabasesConfig()
    let db = try SQLiteDatabase(storage: .file(path: "\(directoryConfig.workDir)profiles.db"))
    databaseConfig.add(database: db, as: .sqlite)
    services.register(databaseConfig)

    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: ProfileData.self, database: .sqlite)
    services.register(migrationConfig)


      

    
    
    
}
