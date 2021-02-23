//
//  hakarunApp.swift
//  hakarun
//
//  Created by masatora on 2021/02/16.
//

import SwiftUI

@main
struct hakarunApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
            
        }
    }
}
