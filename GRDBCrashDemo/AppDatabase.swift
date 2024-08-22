// By Dennis Müller

import Foundation
import GRDB
import OSLog

struct AppDatabase {
  private var enforceConstraints: Bool
  init(_ dbWriter: any DatabaseWriter, enforceConstraints: Bool = true) throws {
    self.dbWriter = dbWriter
    self.enforceConstraints = enforceConstraints
    try migrator.migrate(dbWriter)
  }

  let dbWriter: any DatabaseWriter
}

// MARK: - Database Configuration

extension AppDatabase {
  private static let sqlLogger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "SQL")

  public static func makeConfiguration(_ base: Configuration = Configuration()) -> Configuration {
    return base
  }
}

// MARK: - Database Migrations

extension AppDatabase {
  private var migrator: DatabaseMigrator {
    return DatabaseMigrator()
  }
}
