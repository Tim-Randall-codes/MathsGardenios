//
//  MotherView.swift
//  MathsGardenios
//
//  Created by Tim Randall on 14/10/21.
//

import SwiftUI
import CoreData

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var correct: IntOO
    @ObservedObject var incorrect: IntOO
    @ObservedObject var gameMode: IntOO
    @ObservedObject var digits: Int2OO
    @ObservedObject var numOne: IntOO
    @ObservedObject var numTwo: IntOO
    @ObservedObject var problemType: IntOO
    @ObservedObject var questionChar: StringOO
    @ObservedObject var seconds: SecondsOO
    @ObservedObject var pause: BoolOO
    @ObservedObject var accuracy: IntOO
    var body: some View {
        if viewRouter.currentPage == 1 {
            ContentView(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 2 {
            ContentView2(viewRouter: viewRouter, gameMode: gameMode, numOne: numOne, numTwo: numTwo, problemType: problemType, digits: digits, questionChar: questionChar, seconds: seconds, pause: pause, correct: correct, incorrect: incorrect, accuracy: accuracy)
        }
        else if viewRouter.currentPage == 3 {
            ContentView3(viewRouter: viewRouter, gameMode: gameMode, digits: digits, correct: correct, incorrect: incorrect, numOne: numOne, numTwo: numTwo, problemType: problemType, questionChar: questionChar, seconds: seconds, pause: pause, accuracy: accuracy)
        }
        else if viewRouter.currentPage == 4 {
            ContentView4(viewRouter: viewRouter, correct: correct, incorrect: incorrect, accuracy: accuracy)
        }
        else if viewRouter.currentPage == 5 {
            ContentView5(viewRouter: viewRouter, digits: digits)
        }
        else if viewRouter.currentPage == 6 {
            ContentView6(viewRouter: viewRouter, correct: correct, incorrect: incorrect, accuracy: accuracy)
        }
        else if viewRouter.currentPage == 7 {
            ContentView7(viewRouter: viewRouter)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), correct: IntOO(), incorrect: IntOO(), gameMode: IntOO(), digits: Int2OO(), numOne: IntOO(), numTwo: IntOO(), problemType: IntOO(), questionChar: StringOO(), seconds: SecondsOO(), pause: BoolOO(), accuracy: IntOO())
    }
}
