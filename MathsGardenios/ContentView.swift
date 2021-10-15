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
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Text("Hello world")
            }
        }
    }
}

struct ContentView3: View {
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

struct ContentView4: View {
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

struct ContentView5: View {
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

struct ContentView6: View {
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
