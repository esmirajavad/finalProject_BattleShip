/*:
 ## CIS137 iOS/SWIFT Programming
 ## Final Project
 ## BattleShip Game

 Student: Esmira Babayeva
 Instructor: Hellen Pacheco
 02 December, 2025
*/

// GameView.swift - View

import SwiftUI

// Simple scale-only style for grid cells
struct GridCellButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct GameView: View {
    @ObservedObject var viewModel: BattleshipViewModel

    var body: some View {
        VStack(spacing: 16) {
            // Status message
            Text(viewModel.statusMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Stats row: shots + hits
            HStack {
                Text("Shots: \(viewModel.shotsFired)/\(viewModel.maxShots)")
                Spacer()
                Text("Hits: \(viewModel.hits)/\(viewModel.totalShipParts)")
            }
            .font(.subheadline)
            .padding(.horizontal)

            // Grid setup (8x8 or depending on size)
            let columns = Array(
                repeating: GridItem(.flexible(), spacing: 4),
                count: viewModel.size
            )

            // Grid (no ScrollView – it should fit on screen)
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(0 ..< viewModel.size * viewModel.size, id: \.self) { index in
                    let row = index / viewModel.size
                    let col = index % viewModel.size

                    Button {
                        viewModel.handleTap(row: row, col: col)
                    } label: {
                        CellView(state: viewModel.cellState(row: row, col: col))
                    }
                    .buttonStyle(GridCellButtonStyle())
                }
            }
            .padding()
            .frame(maxHeight: 350)

            // Reset button
            Button("Reset Game") {
                viewModel.resetGame()
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .navigationTitle("Battlefield")
    }
}

// Cell View

struct CellView: View {
    let state: CellState

    var body: some View {
        Rectangle()
            .fill(colorForState)
            .frame(height: 32)
            .overlay(
                Rectangle()
                    .stroke(Color.white.opacity(0.6), lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: state)
    }

    private var colorForState: Color {
        switch state {
        case .unknown:
            return Color.blue.opacity(0.7)
        case .miss:
            return Color.gray.opacity(0.4)
        case .hit:
            return Color.red.opacity(0.8)
        }
    }
}

// Preview

#Preview {
    GameView(viewModel: BattleshipViewModel(difficulty: .easy))
}
