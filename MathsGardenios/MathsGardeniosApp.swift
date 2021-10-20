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
    @StateObject var digits = Int2OO()
    @StateObject var numOne = IntOO()
    @StateObject var numTwo = IntOO()
    @StateObject var problemType = IntOO()
    @StateObject var questionChar = StringOO()
    @StateObject var seconds = SecondsOO()
    @StateObject var pause = BoolOO()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter, correct: correct, incorrect: incorrect, gameMode: gameMode, digits: digits, numOne: numOne, numTwo: numTwo, problemType: problemType, questionChar: questionChar, seconds: seconds, pause: pause).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
