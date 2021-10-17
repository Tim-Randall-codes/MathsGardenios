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
    @ObservedObject var digits: IntOO
    @ObservedObject var numOne: IntOO
    @ObservedObject var numTwo: IntOO
    @ObservedObject var problemType: IntOO
    var body: some View {
        if viewRouter.currentPage == 1 {
            ContentView(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 2 {
            ContentView2(viewRouter: viewRouter, gameMode: gameMode, numOne: numOne, numTwo: numTwo, problemType: problemType)
        }
        else if viewRouter.currentPage == 3 {
            ContentView3(viewRouter: viewRouter, gameMode: gameMode, digits: digits, correct: correct, incorrect: incorrect, numOne: numOne, numTwo: numTwo, problemType: problemType)
        }
        else if viewRouter.currentPage == 4 {
            ContentView4(viewRouter: viewRouter, correct: correct, incorrect: incorrect)
        }
        else if viewRouter.currentPage == 5 {
            ContentView5(viewRouter: viewRouter, digits: digits)
        }
        else if viewRouter.currentPage == 6 {
            ContentView6(viewRouter: viewRouter, correct: correct, incorrect: incorrect)
        }
        else if viewRouter.currentPage == 7 {
            ContentView7(viewRouter: viewRouter)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), correct: IntOO(), incorrect: IntOO(), gameMode: IntOO(), digits: IntOO(), numOne: IntOO(), numTwo: IntOO(), problemType: IntOO())
    }
}
