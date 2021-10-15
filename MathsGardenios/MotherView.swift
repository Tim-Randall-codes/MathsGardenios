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
    var body: some View {
        if viewRouter.currentPage == 1 {
            ContentView(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 2 {
            ContentView2(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 3 {
            ContentView3(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 4 {
            ContentView4(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 5 {
            ContentView5(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 6 {
            ContentView6(viewRouter: viewRouter)
        }
        else if viewRouter.currentPage == 7 {
            ContentView7(viewRouter: viewRouter)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
