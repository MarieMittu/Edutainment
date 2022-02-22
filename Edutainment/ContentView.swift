//
//  ContentView.swift
//  Edutainment
//
//  Created by Maria Smirnova on 12/01/22.
//

import SwiftUI

struct ContentView: View {
    
    //    @State private var numbers = [2...10].shuffled()
    //    @State private var leftNumber = Int.random(in: 2...10)
    //    @State private var rightNumber = Int.random(in: 2...10)
    //    @State private var answer: Int = 0
    //
    //    @State private var userScore: Int = 0
    //    @State private var scoreTitle = ""
    //    @State private var showingScore = false
    @State private var numberOfQuestions: Int = 0
    @State private var startGame = false
    @State private var isPresented = false
    //    @State private var gameLevel = [5: "Easy", 10: "Medium", 20: "Hard"]
    
    var body: some View {
        NavigationView {
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
                
                
                
                VStack(alignment: .center) {
                    
                    Spacer()
                    Spacer()
                    Button("Easy", action: {startGame = true
                        numberOfQuestions = 5})
                        .foregroundColor(.black)
                        .frame(width: 160, height: 80)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    Spacer()
                    Button("Medium", action: {startGame = true
                        numberOfQuestions = 10})
                        .foregroundColor(.black)
                        .frame(width: 160, height: 80)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    Spacer()
                    Button("Hard", action: {startGame = true
                        numberOfQuestions = 20})
                        .foregroundColor(.black)
                        .frame(width: 160, height: 80)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    Spacer()
                    Spacer()
                }
                .overlay {
                    NavigationLink("", destination: One(numberOfQuestions: numberOfQuestions), isActive: $startGame)
                }
                //            .navigationTitle("Choose the Level")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Choose your Level")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .padding(.top)
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
