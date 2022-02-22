//
//  StartScreen.swift
//  Edutainment
//
//  Created by Maria Smirnova on 22/01/22.
//

import SwiftUI

struct StartScreen: View {
    @State var numberOfQuestions: Int = 0
    
    var body: some View {
        VStack {
            Text("Choose the level:")
            Button("Easy") {numberOfQuestions = 3}
            Button("Medium") {}
            Button("Hard") {}
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
