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
    @StateObject var correct = IntOO()
    @StateObject var incorrect = IntOO()
    @StateObject var gameMode = IntOO()
    @StateObject var digits = IntOO()
    @StateObject var numOne = IntOO()
    @StateObject var numTwo = IntOO()
    @StateObject var problemType = IntOO()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter, correct: correct, incorrect: incorrect, gameMode: gameMode, digits: digits, numOne: numOne, numTwo: numTwo, problemType: problemType).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
