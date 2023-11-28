//
//  RockPaperScissors.swift
//  Simple Games
//
//  Created by Celine Quek on 27/11/23.
//

import SwiftUI

struct RockPaperScissors: View {
    
    @State private var playerChoice = "rock"
    @State private var choiceIsFinalised = false
    
    var body: some View {
        VStack {
            HStack {
                if !choiceIsFinalised || playerChoice == "rock" {
                    Button() {
                        playerChoice = "rock"
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == "rock" ? "circle.fill" : "circle")
                            Text("Rock")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.red)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == "rock" ? .bold : .regular)
                }
                
                if !choiceIsFinalised || playerChoice == "paper" {
                    Button() {
                        playerChoice = "paper"
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == "paper" ? "square.fill" : "square")
                            Text("Paper")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.yellow)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == "paper" ? .bold : .regular)
                }
                
                if !choiceIsFinalised || playerChoice == "scissors" {
                    Button() {
                        playerChoice = "scissors"
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == "scissors" ? "triangle.fill" : "triangle")
                            Text("Scissors")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.blue)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == "scissors" ? .bold : .regular)
                }
            }
            .font(.title3)
            .foregroundColor(.white)
            Button() {
                withAnimation() {
                    choiceIsFinalised.toggle()
                }
            } label: {
                Text("I'm Ready")
                    .frame(width: 250, height: 50)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(5)
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    RockPaperScissors()
}
