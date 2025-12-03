/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Final Project
 
 ## BattleShip Game
 
 Student: Esmira Babayeva
 
 Instructor: Hellen Pacheco
 
 02 December, 2025
 
 */

// ContentView.swift  - View


import SwiftUI

enum Difficulty: Hashable  {
    case easy
    case hard
}

// Custom animated button style
struct BattleshipButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .frame(maxWidth: 300)          // button length
            .padding(.vertical, 18)              //  button height
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
            .shadow(radius: configuration.isPressed ? 2 : 8)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}


struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 34) {
                
                Text("Battleship")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                Text("Select difficulty to begin")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                
                // button: Easy
                NavigationLink(value: Difficulty.easy) {
                    Text("Easy")
                }
                .buttonStyle(BattleshipButtonStyle(color: .green))
                
                // button : Hard
                NavigationLink(value: Difficulty.hard) {
                    Text("Hard")
                }
                .buttonStyle(BattleshipButtonStyle(color: .red))
                
                
                Image("ship")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .padding(.top, 30)
                    .opacity(0.95)
                
                
                Spacer()
            }
            .padding(.top, 40) // top padding
            .navigationDestination(for: Difficulty.self) { difficulty in
                GameView(viewModel: BattleshipViewModel(difficulty: difficulty))
            }
        }
    }
}

#Preview {
    ContentView()
}
