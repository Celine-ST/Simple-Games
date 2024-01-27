//
//  RockPaperScissors.swift
//  Simple Games
//
//  Created by Celine Quek on 27/11/23.
//

import SwiftUI

struct RockPaperScissors: View {
    
    enum Sign {
        case rock, paper, scissors, none
    }
    
    enum Result {
        case win, draw, lose, picking
    }
    
    @State private var playerChoice = Sign.none
    @State private var comChoice = Sign.none
    @State private var event: Result = .picking
    @State private var buttonText = "I'm Ready"
    
    var body: some View {
        VStack {
                VStack {
                    Image(systemName: comChoice == .rock ? "circle.fill" : comChoice == .paper ? "square.fill" : comChoice == .scissors ? "triangle.fill" : "questionmark")
                    Text(comChoice == .rock ? "Rock" : comChoice == .paper ? "Paper" : comChoice == .scissors ? "Scissors" : "???")
                }
                .frame(width: 100, height: 75)
                .background(comChoice == .rock ? .red : comChoice == .paper ? .yellow : comChoice == .scissors ? .blue : .purple)
                .cornerRadius(30)
                .fontWeight(.bold)
                .foregroundStyle(Color(.white))
            HStack {
                if event == .picking || playerChoice == .rock {
                    Button() {
                        playerChoice = .rock
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == .rock ? "circle.fill" : "circle")
                            Text("Rock")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.red)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == .rock ? .bold : .regular)
                }
                
                if event == .picking || playerChoice == .paper {
                    Button() {
                        playerChoice = .paper
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == .paper ? "square.fill" : "square")
                            Text("Paper")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.yellow)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == .paper ? .bold : .regular)
                }
                
                if event == .picking || playerChoice == .scissors {
                    Button() {
                        playerChoice = .scissors
                    } label: {
                        VStack {
                            Image(systemName: playerChoice == .scissors ? "triangle.fill" : "triangle")
                            Text("Scissors")
                        }
                    }
                    .frame(width: 100, height: 75)
                    .background(.blue)
                    .cornerRadius(30)
                    .fontWeight(playerChoice == .scissors ? .bold : .regular)
                }
            }
            .font(.title3)
            .foregroundColor(.white)
            Button() {
                withAnimation() {
                    switch event {
                    case .picking:
                        if playerChoice != .none {
                            switch Int.random(in: 0...2) {
                            case 0:
                                comChoice = .rock
                                switch playerChoice {
                                case .rock:
                                    event = .draw
                                case .paper:
                                    event = .win
                                default:
                                    event = .lose
                                }
                            case 1:
                                comChoice = .paper
                                switch playerChoice {
                                case .rock:
                                    event = .lose
                                case .paper:
                                    event = .draw
                                default:
                                    event = .win
                                }
                            default:
                                comChoice = .scissors
                                switch playerChoice {
                                case .rock:
                                    event = .win
                                case .paper:
                                    event = .lose
                                default:
                                    event = .draw
                                }
                            }
                        }
                    default:
                        event = .picking
                        playerChoice = .none
                        comChoice = .none
                    }
                    buttonText = event == .picking ? "I'm Ready" : "Reset"
                
                }
            } label: {
                Text(buttonText)
                    .frame(width: 250, height: 50)
                    .background(playerChoice == .none || event != .picking ? .orange : .green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.title2)
                    .fontWeight(playerChoice == .none || event != .picking ? .regular : .bold)
                    .padding(5)
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    RockPaperScissors()
}
