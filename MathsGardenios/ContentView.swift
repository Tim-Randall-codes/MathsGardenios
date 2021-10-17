//
//  ContentView.swift
//  MathsGardenios
//
//  Created by Tim Randall on 14/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Spacer()
                Title(words: "Maths Garden").padding()
                Spacer()
                Image("garden").resizable()
                    .frame(width: 200, height: 200)
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 2
                }, label:{
                    ButtonWidget(words: "test")
                })
                Spacer()
            }
        }
    }
}

struct ContentView2: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var gameMode: IntOO
    @StateObject var numOne: IntOO
    @StateObject var numTwo: IntOO
    @StateObject var problemType: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "Maths Garden")
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 1
                }, label:{
                    TextWidget(words: "Addition")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 2
                }, label:{
                    TextWidget(words: "Addition and subtraction")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 3
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 4
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication, division")
                })
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 4
                }, label:{
                    TextWidget(words: "Select difficulty")
                })
                Button(action:{
                    viewRouter.currentPage = 6
                }, label:{
                    TextWidget(words: "View high scores")
                })
            }
        }
    }
}

struct ContentView3: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var gameMode: IntOO
    @ObservedObject var digits: IntOO
    @StateObject var correct: IntOO
    @StateObject var incorrect: IntOO
    @StateObject var numOne: IntOO
    @StateObject var numTwo: IntOO
    @StateObject var problemType: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView4: View {
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var correct: IntOO
    @ObservedObject var incorrect: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView5: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var digits: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView6: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var correct: IntOO
    @ObservedObject var incorrect: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView7: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
