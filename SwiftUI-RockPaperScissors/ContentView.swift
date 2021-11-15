//
//  ContentView.swift
//  SwiftUI-RockPaperScissors
//
//  Created by Никита on 12.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var playerChoice = ""
    @State private var showingResult = false
    @State private var resultTitle = ""
    @State private var score = 0
    @State private var gameCount = 0
    @State private var resultText = ""
    
    
   var variants = ["🪨", "📄", "✂️"]
    
   @State private var appChoice = "🪨"
    
    var body: some View {
        Form{
            Section{
                VStack{
                    Text("Your score is \(score)")
                }
            } header: {
                Text("Score")
            }
            Section{
                ForEach(0..<3){ number in
                    Button {
                        playerChoice = variants[number]
                        choiseTapped()
                    }
                    label: {
                            Text(variants[number])
                    } .frame(maxWidth: .infinity, minHeight: 50)
                        .font(.system(size: 60))
                }
            } header: {
                Text("Your Choice")
            }
                .alert(resultTitle, isPresented: $showingResult) {
                    Button("Continue", action: newRound)
                } message: {
                    Text(resultText)
                }
            }
        }
    
    func choiseTapped(){
        // App choice is ROCK
        if playerChoice == "🪨" && appChoice == "🪨" {
            resultTitle = "Draw!"
            resultText = "Player choice: \(playerChoice)  \nOpponent choice: \(appChoice)"
        } else if playerChoice == "✂️" && appChoice == "🪨" {
            resultTitle = "Lose!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score -= 1
        } else if playerChoice == "📄" && appChoice == "🪨" {
            resultTitle = "Win!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score += 1
            
        // App choice if Papper
        }else if playerChoice == "📄" && appChoice == "📄" {
            resultTitle = "Draw!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
        } else if playerChoice == "🪨" && appChoice == "📄" {
            resultTitle = "Lose"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score -= 1
        } else if playerChoice == "✂️" && appChoice == "📄" {
            resultTitle = "Win!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score += 1
            
        // App Choice is Scissors
        }else if playerChoice == "✂️" && appChoice == "✂️" {
            resultTitle = "Draw!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
        } else if playerChoice == "📄" && appChoice == "✂️" {
            resultTitle = "Lose!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score -= 1
        } else if playerChoice == "🪨" && appChoice == "✂️" {
            resultTitle = "Win!"
            resultText = "Player choice: \(playerChoice) \nOpponent choice: \(appChoice)"
            score += 1
        }
        showingResult = true
    }
    
    func newRound(){
        appChoice = variants[Int.random(in: 0...2)]
        gameCount += 1
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
