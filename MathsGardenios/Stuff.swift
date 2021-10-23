//
//  Stuff.swift
//  MathsGardenios
//
//  Created by Tim Randall on 14/10/21.
//

import Foundation
import SwiftUI

struct ButtonWidget: View {
    var words: String
    var body: some View {
        Text(words)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(30)
    }
}

struct ButtonWidgetYellow: View {
    var words: String
    var body: some View {
        Text(words)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(Color.yellow)
            .cornerRadius(30)
    }
}

struct Background: View {
    var body: some View {
            LinearGradient(gradient: Gradient(colors: [.white, .white, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct Title: View {
    var words: String
    var body: some View {
        Text(words).font(.system(size: 24, weight: .bold))
    }
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Int = 1
}

struct TextWidget: View {
    var words: String
    var body: some View {
        Text(words)
            .font(.system(size: 18, weight: .light))
            .foregroundColor(.black)
            .padding()
    }
}

class IntOO: ObservableObject {
    @Published var num: Int = 0
    @Published var num2: Float = 0
    @Published var boo: Bool = false
}

class StringOO: ObservableObject {
    @Published var words: String = ""
}

class Int2OO: ObservableObject {
    @Published var num: Int = 1
}

class SecondsOO: ObservableObject {
    @Published var num: Int = 60
}

class BoolOO: ObservableObject {
    @Published var boo: Bool = false
}

let dummy1 = Player()
let dummy2 = Player()
let dummy3 = Player()
let dummy4 = Player()
let dummy5 = Player()
