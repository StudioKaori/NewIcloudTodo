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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
