//
//  MathsGardeniosApp.swift
//  MathsGardenios
//
//  Created by Tim Randall on 14/10/21.
//

import SwiftUI
import CoreData

@main
struct MathsGardeniosApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
