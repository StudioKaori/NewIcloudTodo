//
//  NewIcloudTodoApp.swift
//  NewIcloudTodo
//
//  Created by Kaori Persson on 2023-05-17.
//

import SwiftUI

@main
struct NewIcloudTodoApp: App {
  let persistenceController = PersistenceController.shared
  let homeVM = HomeViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environmentObject(homeVM)
    }
  }
}
