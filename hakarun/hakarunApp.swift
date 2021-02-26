//
//  hakarunApp.swift
//  hakarun
//
//  Created by masatora on 2021/02/16.
//

import SwiftUI

@main
struct hakarunApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var modelData = ModelData()
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(ModelData())
            
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
