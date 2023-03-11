//
//  ContentView.swift
//  Edutainment
//
//  Created by Comet PC on 3/10/23.
//

import SwiftUI

let twoTimesTable = ["2 x 1": 2, "2 x 2": 4, "2 x 3": 6, "2 x 4": 8, "2 x 5": 10, "2 x 6": 12, "2 x 7": 14, "2 x 8": 16, "2 x 9": 18, "2 x 10": 20, "2 x 11": 22, "2 x 12": 24]
let threeTimesTable = ["3 x 1": 3, "3 x 2": 6, "3 x 3": 9, "3 x 4": 12, "3 x 5": 15, "3 x 6": 18, "3 x 7": 21, "3 x 8": 24, "3 x 9": 27, "3 x 10": 30, "3 x 11": 33, "3 x 12": 36]
let fourTimesTable = ["4 x 1": 4, "4 x 2": 8, "4 x 3": 12, "4 x 4": 16, "4 x 5": 20, "4 x 6": 24, "4 x 7": 28, "4 x 8": 32, "4 x 9": 36, "4 x 10": 40, "4 x 11": 44, "4 x 12": 48]
let fiveTimesTable = ["5 x 1": 5, "5 x 2": 10, "5 x 3": 15, "5 x 4": 20, "5 x 5": 25, "5 x 6": 30, "5 x 7": 35, "5 x 8": 40, "5 x 9": 45, "5 x 10": 50, "5 x 11": 55, "5 x 12": 60]
let sixTimesTable = ["6 x 1": 6, "6 x 2": 12, "6 x 3": 18, "6 x 4": 24, "6 x 5": 30, "6 x 6": 36, "6 x 7": 42, "6 x 8": 48, "6 x 9": 54, "6 x 10": 60, "6 x 11": 66, "6 x 12": 72]
let sevenTimesTable = ["7 x 1": 7, "7 x 2": 14, "7 x 3": 21, "7 x 4": 28, "7 x 5": 35, "7 x 6": 42, "7 x 7": 49, "7 x 8": 56, "7 x 9": 63, "7 x 10": 70, "7 x 11": 77, "7 x 12": 84]
//let allTimesTables = Array(zip(twoTimesTable, threeTimesTable))
let allTimesTables = [twoTimesTable, threeTimesTable, fourTimesTable, fiveTimesTable, sixTimesTable, sevenTimesTable]
struct ContentView: View {
    @State private var difficulty = 2
    @State private var difficultyRange = 2...7
    @State private var questionAndAnswer = Array(["1 x 1": 1])
    @State private var questions = 0
    @State private var answer: Int? = nil
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var questionNumber = 0
    @State private var gameEnded = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Times table:").font(.headline)) {
                        Stepper("\(difficulty)", value: $difficulty, in: difficultyRange)
                    }
                    Section(header: Text("Questions:").font(.headline)) {
                        HStack {
                            Button {
                                questions = 2
                            } label: {
                                Text("Five")
                            }
                            
                            Spacer()
                            Button {
                                questions = 3
                            } label: {
                                Text("Ten")
                            }
                            
                            Spacer()
                            Button {
                                questions = 4
                            } label: {
                                Text("Twenty")
                            }
                            
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.regularMaterial)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Text(scoreTitle)
                    Section(header: Text("Times table:").font(.headline)) {
                        Text(questionAndAnswer[0].key)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Section(header: Text("Enter your answer:").font(.headline)) {
                        TextField("number", value: $answer, format: .number)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                    }
                }
            }
            .navigationTitle("Edutainment")
            .onAppear {
                generateQuestionAndAnswer()
            }
            .onChange(of: difficulty) { newValue in
                generateQuestionAndAnswer()
            }
            .onChange(of: isFocused) { newValue in
                checkAnswer()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: endGame)
            } message: {
                Text("Your score is: \(score)")
            }
            .alert(scoreTitle, isPresented: $gameEnded) {
                Button("Reset", action: resetGame)
            } message: {
                Text("Tap to reset the game.")
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
    func generateQuestionAndAnswer() {
        let parameter: KeyPath<[[String: Int]], [String: Int]> = \.[0]
        let parameter1: KeyPath<[[String: Int]], [String: Int]> = \.[1]
        let parameter2: KeyPath<[[String: Int]], [String: Int]> = \.[2]
        let parameter3: KeyPath<[[String: Int]], [String: Int]> = \.[3]
        let parameter4: KeyPath<[[String: Int]], [String: Int]> = \.[4]
        let parameter5: KeyPath<[[String: Int]], [String: Int]> = \.[5]
        let parameter6: KeyPath<[[String: Int]], [String: Int]> = \.[6]
        let parameterArray = [parameter, parameter1, parameter2, parameter3, parameter4, parameter5, parameter6]
        
        for table in allTimesTables {
            for questionAnswerPair in table {
                for i in difficultyRange {
                    if ("\(difficulty) x 1" == "\(questionAnswerPair.key)" && difficulty == i) {
                        questionAndAnswer[0] = allTimesTables[keyPath: parameterArray[i - 2]].randomElement()!
                    }
                }
            }
        }
    }
    func checkAnswer() {
        if (!isFocused) {
            showingScore = true
        }
        if ((answer == 0 || answer == nil) && !isFocused) {
            scoreTitle = "Please try."
        }
        if (answer == questionAndAnswer[0].value && answer != 0 && answer != nil && !isFocused) {
            score += 1
            scoreTitle = "Correct!"
            questionNumber += 1
        } else if (answer != questionAndAnswer[0].value && answer != 0 && answer != nil && !isFocused) {
            scoreTitle = "Wrong"
            questionNumber += 1
        }
    }
    func endGame() {
        if (questionNumber >= questions) {
            scoreTitle = "Game Over!"
            gameEnded = true
        } else if (answer != 0 && answer != nil) {
            generateQuestionAndAnswer()
        }
        answer = nil
    }
    
    func resetGame() {
        score = 0
        questionNumber = 0
        scoreTitle = ""
        generateQuestionAndAnswer()
        gameEnded = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
