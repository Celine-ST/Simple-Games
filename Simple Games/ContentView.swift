//
//  ContentView.swift
//  Simple Games
//
//  Created by Celine Quek on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            RockPaperScissors()
                .tabItem {
                    Label("Rock Paper Scissors", systemImage: "hand.wave")
                }
        }
    }
}

#Preview {
    ContentView()
}
