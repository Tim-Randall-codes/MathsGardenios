//
//  ContentView.swift
//  MathsGardenios
//
//  Created by Tim Randall on 14/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Background()
            VStack{
                Title(words: "Title test")
                Text("Hello, world!")
                    .padding()
                ButtonWidget(words: "test")
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
