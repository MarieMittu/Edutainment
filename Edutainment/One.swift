//
//  1.swift
//  Edutainment
//
//  Created by Maria Smirnova on 31/01/22.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ContentView()
    }
}

struct One: View {
    @State private var leftNumber = Int.random(in: 2...10)
    @State private var rightNumber = Int.random(in: 2...10)
    @State private var answer: Int = 0
    
    @State private var userScore: Int = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State var numberOfQuestions: Int
    @State var checkQuestion: Int = 0
    
    @State private var showingSheet = false
    //    @State private var startGame = false
    
    @Environment(\.dismiss) var dismissAction
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach((1...20).reversed(), id: \.self) { i in
                    HStack(spacing: 0) {
                        ForEach((1...10).reversed(), id: \.self) { i in
                            Color.blue
                            Color.white
                        }
                    }
                    HStack(spacing: 0) {
                        ForEach((1...10).reversed(), id: \.self) { i in
                            Color.white
                            Color.blue
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.all)
                .opacity(0.10)
            
            
            VStack {
                Spacer()
                Group {
                    Text("What is")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                    
                    Text("\(leftNumber) x \(rightNumber)")
                    //                    .font(.largeTitle)
                        .fontWeight(.black)
                        .font(Font.custom("New York", size: 100))
                    Spacer()
                    
                    Text("Answer")
                        .font(.title)
                        .fontWeight(.bold)
                }
                TextField("", value: $answer, format: .number)
                    .frame(width: 100, height: 50, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.numberPad)
                Button("Submit") {
                    submitAnswer()
                }
                .foregroundColor(.white)
                .frame(width: 160, height: 80)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                
                Spacer()
                Group {
                    Text("Score: \(userScore)")
                        .font(.title)
                    Spacer()
                    Text("Questions: \(checkQuestion)/\(numberOfQuestions)")
                    Spacer()
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button(checkQuestion < numberOfQuestions ? "Next question" : "New Game", action: {
                    if checkQuestion < numberOfQuestions {
                        askQuestion()
                    } else {
                        showingSheet.toggle()
                        dismissAction()
                    }
                }) .sheet(isPresented: $showingSheet) {
                    SecondView()
                }
                
            } message: {
                if checkQuestion < numberOfQuestions {
                    Text("Your score is \(userScore)")
                } else {
                    Text("Your total score is \(userScore)")
                }
            }
        }
    }
    func submitAnswer() {
        if answer == leftNumber * rightNumber {
            scoreTitle = "That's right!"
            userScore += 1
        } else {
            scoreTitle = "Wrong! \(leftNumber) x \(rightNumber) = \(leftNumber * rightNumber)"
        }
        showingScore = true
        checkQuestion += 1
    }
    
    func askQuestion() {
        if checkQuestion == numberOfQuestions {
            numberOfQuestions = 0
            checkQuestion = 0
            userScore = 0
        }
        leftNumber = Int.random(in: 2...10)
        rightNumber = Int.random(in: 2...10)
    }
}

struct One_Previews: PreviewProvider {
    static var previews: some View {
        One(numberOfQuestions: 5)
    }
}
