//
//  CinephileApp.swift
//  Cinephile
//
//  Created by Setu Desai on 2/4/24.
//

import SwiftUI

@main
struct CinephileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CPTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
