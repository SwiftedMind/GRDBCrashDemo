// By Dennis Müller

import Foundation
import GRDB
import OSLog

struct AppDatabase {
  init(_ dbWriter: any DatabaseWriter) throws {
    self.dbWriter = dbWriter
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
