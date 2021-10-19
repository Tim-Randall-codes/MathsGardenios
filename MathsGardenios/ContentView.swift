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
                    ButtonWidget(words: "Start")
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
    @StateObject var digits: Int2OO
    @StateObject var questionChar: StringOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "Maths Garden")
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 1
                    startNewGame()
                }, label:{
                    TextWidget(words: "Addition")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 2
                    startNewGame()
                }, label:{
                    TextWidget(words: "Addition and subtraction")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 3
                    startNewGame()
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 4
                    startNewGame()
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication, division")
                })
                Spacer()
                Button(action:{
                    digits.num = 1
                    viewRouter.currentPage = 5
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
    func startNewGame(){
        // generate numbers
        if digits.num == 1 {
            numOne.num = Int.random(in: 1..<10)
            numTwo.num = Int.random(in: 1..<10)
        }
        else if digits.num == 2 {
            numOne.num = Int.random(in: 1..<100)
            numTwo.num = Int.random(in: 1..<100)
        }
        else if digits.num == 3 {
            numOne.num = Int.random(in: 1..<1000)
            numTwo.num = Int.random(in: 1..<1000)
        }
        // generate random symbol eg plus
        if gameMode.num == 1 {
            problemType.num = 0
        }
        else if gameMode.num == 2 {
            problemType.num = Int.random(in: 0...1)
        }
        else if gameMode.num == 3 {
            problemType.num = Int.random(in: 0...2)
        }
        else if gameMode.num == 4 {
            problemType.num = Int.random(in: 0...3)
        }
        // make question's character
        if problemType.num == 0 {
            questionChar.words = "+"
        }
        else if problemType.num == 1 {
            questionChar.words = "-"
        }
        else if problemType.num == 2 {
            questionChar.words = "x"
        }
        else if problemType.num == 3 {
            questionChar.words = "/"
        }
    }
}

struct ContentView3: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var gameMode: IntOO
    @ObservedObject var digits: Int2OO
    @StateObject var correct: IntOO
    @StateObject var incorrect: IntOO
    @StateObject var numOne: IntOO
    @StateObject var numTwo: IntOO
    @StateObject var problemType: IntOO
    @StateObject var questionChar: StringOO
    @State var userInputString: String = ""
    @State var userEntry: Int = 0
    @State var displayMessage: String = ""
    @State var letInputThrough: Bool = false
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                TextWidget(words: "Correct: \(String(correct.num)) Incorrect: \(String(incorrect.num))")
                TextWidget(words: "\(numOne.num) \(questionChar.words) \(numTwo.num) =")
                TextWidget(words: displayMessage)
                TextField("put answer here", text: $userInputString)
                Button(action:{
                    checkInput()
                    if letInputThrough == true {
                        game()
                        startNewGame()
                    }
                }, label:{
                    ButtonWidget(words: "Answer")
                })
            }
            .keyboardType(.numberPad)
        }
    }
    func startNewGame(){
        // generate numbers
        if digits.num == 1 {
            numOne.num = Int.random(in: 1..<10)
            numTwo.num = Int.random(in: 1..<10)
        }
        else if digits.num == 2 {
            numOne.num = Int.random(in: 1..<100)
            numTwo.num = Int.random(in: 1..<100)
        }
        else if digits.num == 3 {
            numOne.num = Int.random(in: 1..<1000)
            numTwo.num = Int.random(in: 1..<1000)
        }
        // generate random symbol eg plus
        if gameMode.num == 1 {
            problemType.num = 0
        }
        else if gameMode.num == 2 {
            problemType.num = Int.random(in: 0...1)
        }
        else if gameMode.num == 3 {
            problemType.num = Int.random(in: 0...2)
        }
        else if gameMode.num == 4 {
            problemType.num = Int.random(in: 0...3)
        }
        // make question's character
        if problemType.num == 0 {
            questionChar.words = "+"
        }
        else if problemType.num == 1 {
            questionChar.words = "-"
        }
        else if problemType.num == 2 {
            questionChar.words = "x"
        }
        else if problemType.num == 3 {
            questionChar.words = "/"
        }
        userInputString = ""
    }
    func checkInput () {
        if let testInt = Int(userInputString) {
            userEntry = testInt
            letInputThrough = true
        }
        else {
            displayMessage = "Please enter only numbers"
            letInputThrough = false
        }
        if userInputString == "" {
            displayMessage = "Please enter an answer"
            letInputThrough = false
        }
        else {
            letInputThrough = true
        }
    }
    func game(){
        if problemType.num == 0 {
            if userEntry == numOne.num + numTwo.num {
                correct.num += 1
            }
            else {
                incorrect.num += 1
            }
        }
        else if problemType.num == 1 {
            if userEntry == numOne.num - numTwo.num {
                correct.num += 1
            }
            else {
                incorrect.num += 1
            }
        }
        else if problemType.num == 2 {
            if userEntry == numOne.num * numTwo.num {
                correct.num += 1
            }
            else {
                incorrect.num += 1
            }
        }
        else {
            if userEntry == numOne.num / numTwo.num {
                correct.num += 1
            }
            else {
                incorrect.num += 1
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
    @StateObject var digits: Int2OO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "Select Difficulty")
                Spacer()
                Button(action:{
                    digits.num = 1
                }, label:{
                    if digits.num == 1 {
                        ButtonWidgetYellow(words: "One digit")
                    }
                    else {
                        ButtonWidget(words: "One digit")
                    }
                })
                Button(action:{
                    digits.num = 2
                }, label:{
                    if digits.num == 2 {
                        ButtonWidgetYellow(words: "Two digits")
                    }
                    else {
                        ButtonWidget(words: "Two digits")
                    }
                })
                Button(action:{
                    digits.num = 3
                }, label:{
                    if digits.num == 3 {
                        ButtonWidgetYellow(words: "Three digits")
                    }
                    else {
                        ButtonWidget(words: "Three digits")
                    }
                })
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 1
                }, label:{
                    ButtonWidget(words: "Back")
                })
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
