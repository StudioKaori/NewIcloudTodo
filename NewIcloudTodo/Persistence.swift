//
//  Persistence.swift
//  NewIcloudTodo
//
//  Created by Kaori Persson on 2023-05-17.
// tutorial video https://www.youtube.com/watch?v=F5B6fbTAl04&t=417s

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
  
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for _ in 0..<10 {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
    }
    do {
      try viewContext.save()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
  
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    
    // icloud step 1
    container = NSPersistentCloudKitContainer(name: "NewIcloudTodo")
    
    // icloud step 2
    //automatically allow silent notification coming in
    container.viewContext.automaticallyMergesChangesFromParent = true
    
    // icloud step 3, set policy
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
}
