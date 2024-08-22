// By Dennis Müller

import Foundation
import GRDB

extension AppDatabase {
  static let shared = makeShared()

  private static func makeShared() -> AppDatabase {
    do {
      let fileManager = FileManager.default
      let appSupportURL = try fileManager.url(
        for: .applicationSupportDirectory, in: .userDomainMask,
        appropriateFor: nil, create: true
      )
      let directoryURL = appSupportURL.appendingPathComponent("Database", isDirectory: true)

      // Create the database folder if needed
      try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)

      // Open or create the database
      let databaseURL = directoryURL.appendingPathComponent("db.sqlite")
      NSLog("Database stored at \(databaseURL.path)")
      let dbPool = try DatabasePool(
        path: databaseURL.path,
        // Use default AppDatabase configuration
        configuration: AppDatabase.makeConfiguration()
      )
      // Create the AppDatabase
      let appDatabase = try AppDatabase(dbPool, enforceConstraints: true)
      
      return appDatabase
    } catch {
      fatalError()
    }
  }
}
