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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Player.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Player.score, ascending: false)]
    )var items: FetchedResults<Player>
    @StateObject var viewRouter: ViewRouter
    @StateObject var gameMode: IntOO
    @StateObject var numOne: IntOO
    @StateObject var numTwo: IntOO
    @StateObject var problemType: IntOO
    @StateObject var digits: Int2OO
    @StateObject var questionChar: StringOO
    @StateObject var seconds: SecondsOO
    @StateObject var pause: BoolOO
    @StateObject var correct: IntOO
    @StateObject var incorrect: IntOO
    @StateObject var accuracy: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "Maths Garden")
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 1
                    resetVariables()
                    startNewGame()
                    countDown()
                }, label:{
                    TextWidget(words: "Addition")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 2
                    resetVariables()
                    startNewGame()
                    countDown()
                }, label:{
                    TextWidget(words: "Addition and subtraction")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 3
                    resetVariables()
                    startNewGame()
                    countDown()
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 4
                    resetVariables()
                    startNewGame()
                    countDown()
                }, label:{
                    TextWidget(words: "Addition, subtraction, multiplication, division")
                })
                Button(action:{
                    viewRouter.currentPage = 3
                    gameMode.num = 4
                    gameMode.boo = true
                    digits.num = 1
                    resetVariables()
                    startNewGame()
                    countDown()
                }, label:{
                    TextWidget(words: "Challenge Mode - see if you can get high score")
                })
                Spacer()
                Button(action:{
                    digits.num = 1
                    viewRouter.currentPage = 5
                }, label:{
                    TextWidget(words: "Select difficulty")
                })
                Button(action:{
                    viewRouter.currentPage = 7
                }, label:{
                    TextWidget(words: "View high scores")
                })
            }
        }
    }
    func resetVariables(){
        seconds.num = 60
        pause.boo = false
        correct.num = 0
        incorrect.num = 0
        accuracy.num2 = 0
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
            numTwo.num = Int.random(in: 1...numOne.num)
        }
        else if problemType.num == 2 {
            questionChar.words = "x"
        }
        else if problemType.num == 3 {
            questionChar.words = "/"
            if digits.num == 1 || digits.num == 2 {
                numOne.num = Int.random(in: 12...100)
            }
            else if digits.num == 3 {
                numOne.num = Int.random(in: 12..<1000)
            }
            numTwo.num = Int.random(in: 1...12)
        }
    }
    func countDown(){
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds.num -= 1
            if seconds.num == 0 {
                timer.invalidate()
                accuracy.num2 = Float(correct.num) / Float((correct.num + incorrect.num)) * 100
                if gameMode.boo == true {
                    gameMode.boo = false
                    if items.indices.contains(5) == true {
                        if correct.num > items[5].score {
                            viewRouter.currentPage = 6
                        }
                        else {
                            viewRouter.currentPage = 4
                        }
                    }
                    else {
                        viewRouter.currentPage = 6
                    }
                }
                else {
                    viewRouter.currentPage = 4
                }
            }
            if pause.boo == true {
                timer.invalidate()
            }
        }
    }
}

struct ContentView3: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Player.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Player.score, ascending: false)]
    )var items: FetchedResults<Player>
    @StateObject var viewRouter: ViewRouter
    @StateObject var gameMode: IntOO
    @ObservedObject var digits: Int2OO
    @StateObject var correct: IntOO
    @StateObject var incorrect: IntOO
    @StateObject var numOne: IntOO
    @StateObject var numTwo: IntOO
    @StateObject var problemType: IntOO
    @StateObject var questionChar: StringOO
    @StateObject var seconds: SecondsOO
    @StateObject var pause: BoolOO
    @StateObject var accuracy: IntOO
    @State var userInputString: String = ""
    @State var userEntry: Int = 0
    @State var userInputStringRemainder: String = ""
    @State var userEntryRemainder: Int = 0
    @State var displayMessage: String = ""
    @State var letInputThrough: Bool = false
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                TextWidget(words: "Correct: \(String(correct.num)) Incorrect: \(String(incorrect.num))")
                HStack{
                    TextWidget(words: "\(String(seconds.num))")
                    Button(action:{
                        if pause.boo == false {
                            pause.boo = true
                        }
                        else {
                            pause.boo = false
                        }
                        countDown()
                    }, label:{
                        TextWidget(words: "Pause")
                    })
                }
                TextWidget(words: "\(numOne.num) \(questionChar.words) \(numTwo.num) =")
                TextWidget(words: displayMessage)
                TextField("put answer here", text: $userInputString)
                if problemType.num == 3 {
                    TextField("put remainder here", text: $userInputStringRemainder)
                }
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
    func countDown(){
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds.num -= 1
            if seconds.num == 0 {
                timer.invalidate()
                accuracy.num2 = Float(correct.num) / Float((correct.num + incorrect.num)) * 100
                if gameMode.boo == true {
                    gameMode.boo = false
                    if items.indices.contains(5) == true {
                        if correct.num > items[5].score {
                            viewRouter.currentPage = 6
                        }
                        else {
                            viewRouter.currentPage = 4
                        }
                    }
                    else {
                        viewRouter.currentPage = 6
                    }
                }
                else {
                    viewRouter.currentPage = 4
                }
            }
            if pause.boo == true {
                timer.invalidate()
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
            numTwo.num = Int.random(in: 1...numOne.num)
        }
        else if problemType.num == 2 {
            questionChar.words = "x"
        }
        else if problemType.num == 3 {
            questionChar.words = "/"
            if digits.num == 1 || digits.num == 2 {
                numOne.num = Int.random(in: 12...100)
            }
            else if digits.num == 3 {
                numOne.num = Int.random(in: 12..<1000)
            }
            numTwo.num = Int.random(in: 1...12)
        }
        userInputString = ""
        userInputStringRemainder = ""
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
        if problemType.num == 3 {
            if let remainderTestInt = Int(userInputStringRemainder) {
                userEntryRemainder = remainderTestInt
                letInputThrough = true
            }
            else {
                displayMessage = "Please enter only numbers"
                letInputThrough = false
            }
            if userInputStringRemainder == "" {
                displayMessage = "Please enter an answer"
                letInputThrough = false
            }
            else {
                letInputThrough = true
            }
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
            if userEntry == numOne.num / numTwo.num && userEntryRemainder == numOne.num % numTwo.num {
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
    @ObservedObject var accuracy: IntOO
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "Results")
                Spacer()
                TextWidget(words: "You got \(correct.num) correct and \(incorrect.num) incorrect!!")
                TextWidget(words: "You got \(String(accuracy.num2))% accuracy!!")
                Spacer()
                Button(action:{
                    viewRouter.currentPage = 2
                }, label:{
                    ButtonWidget(words: "Back to main menu")
                })
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
                    viewRouter.currentPage = 2
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
    @ObservedObject var accuracy: IntOO
    @State var nameString: String = ""
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Spacer()
                Title(words: "Congrats, you got a high score!")
                TextWidget(words: "Good job, you got a high score of \(correct.num)!")
                TextWidget(words: "Please enter your name and press OK")
                TextField("enter your name here", text: $nameString)
                Button(action:{
                    let item = Player(context: managedObjectContext)
                    item.name = nameString
                    item.score = Int64(correct.num)
                    viewRouter.currentPage = 2
                    PersistenceController.shared.save()
                }, label: {
                    ButtonWidget(words: "OK")
                })
                Spacer()
            }
        }
    }
}

struct ContentView7: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Player.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Player.score, ascending: false)]
    )var items: FetchedResults<Player>
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        ZStack{
            Background().edgesIgnoringSafeArea([.all])
            VStack{
                Title(words: "High Scores")
                if items.indices.contains(0) == true {
                    TextWidget(words: "1. \(items[0].name ?? "blank"), \(items[0].score)")
                }
                else{
                    TextWidget(words: "1. No score yet")
                }
                if items.indices.contains(1) == true {
                    TextWidget(words: "2. \(items[1].name ?? "blank"), \(items[1].score)")
                }
                else{
                    TextWidget(words: "2. No score yet")
                }
                if items.indices.contains(2) == true {
                    TextWidget(words: "3. \(items[2].name ?? "blank"), \(items[2].score)")
                }
                else{
                    TextWidget(words: "3. No score yet")
                }
                if items.indices.contains(3) == true {
                    TextWidget(words: "4. \(items[3].name ?? "blank"), \(items[3].score)")
                }
                else{
                    TextWidget(words: "4. No score yet")
                }
                if items.indices.contains(4) == true {
                    TextWidget(words: "5. \(items[4].name ?? "blank"), \(items[4].score)")
                }
                else{
                    TextWidget(words: "5. No score yet")
                }
                Button(action:{
                    viewRouter.currentPage = 2
                }, label:{
                    ButtonWidget(words: "Back")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
