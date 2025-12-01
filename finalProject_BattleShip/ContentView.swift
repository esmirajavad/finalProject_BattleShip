import SwiftUI

enum Difficulty: Hashable  {
    case easy
    case hard
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Battleship")
                    .font(.largeTitle)
                    .bold()
                
                Text("Select difficulty to begin")
                    .font(.subheadline)
                    .padding(.bottom, 30)
                
                // button: Easy
                NavigationLink(value: Difficulty.easy) {
                    Text("Easy")
                        .font(.title2)
                }
                .buttonStyle(.borderedProminent)
                
                // button : Hard
                NavigationLink(value: Difficulty.hard) {
                    Text("Hard")
                        .font(.title2)
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationDestination(for: Difficulty.self) { difficulty in
                GameView(viewModel: BattleshipViewModel(difficulty: difficulty))
            }
        }
    }
}

#Preview {
    ContentView()
}
