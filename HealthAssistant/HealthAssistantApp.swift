//
//  HealthAssistantApp.swift
//  HealthAssistant
//
//  Created by Igor Łopatka on 04/09/2023.
//

import SwiftUI

@main
struct HealthAssistantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
