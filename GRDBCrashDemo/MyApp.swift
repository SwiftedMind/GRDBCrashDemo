// By Dennis Müller

import SwiftUI

@main
struct MyApp: SwiftUI.App {
  init() {
    try! AppDatabase.shared.dbWriter.read { _ in
      
    }
  }

  var body: some Scene {
    WindowGroup {
      Text("ABC")
    }
  }
}
