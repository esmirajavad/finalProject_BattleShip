//BattleShip Game
// ModelView





import SwiftUI

class BattleshipViewModel: ObservableObject {
    @Published private var game: BattleshipGame

    let maxShots: Int

    @Published var statusMessage: String
    @Published var shotsFired: Int
    @Published var hits: Int
    @Published var isGameOver: Bool

    // Init with Difficulty

    init(difficulty: Difficulty) {
        self.game = BattleshipGame.newGame()

        // Set shot limit based on difficulty
        switch difficulty {
        case .easy:
            self.maxShots = 50
        case .hard:
            self.maxShots = 35
        }

        self.statusMessage = "Tap a square to fire!"
        self.shotsFired = 0
        self.hits = 0
        self.isGameOver = false
    }

    // Public computed properties

    var size: Int {
        game.size
    }

    var totalShipParts: Int {
        game.totalShipParts
    }

    // Read the current state of a cell
    func cellState(row: Int, col: Int) -> CellState {
        game.grid[row][col]
    }

    // Game actions

    func handleTap(row: Int, col: Int) {
        // If game is over, ignore taps
        guard !isGameOver else { return }

        // If we're already at or beyond shot limit, ignore
        if shotsFired >= maxShots {
            statusMessage = "No shots left! Game over."
            isGameOver = true
            return
        }

        let result = game.fire(at: row, col: col)

        switch result {
        case .alreadyTried:
            // Don’t count this as a new shot
            statusMessage = "You already fired there!"
            return

        case .miss:
            shotsFired += 1
            statusMessage = "Miss!"

        case .hit:
            shotsFired += 1
            hits += 1
            statusMessage = "Hit!"
        }

        // Check win
        if game.allShipsSunk {
            isGameOver = true
            statusMessage = "You sank all ships in \(shotsFired) shots! 🎉"
        }
        // Check loss (used all shots but ships still remain)
        else if shotsFired >= maxShots {
            isGameOver = true
            statusMessage = "Out of shots! You lost. Ships remain at sea. 🚢"
        }

        // Not strictly required since @Published vars changed,
        // but doesn't hurt to ensure updates:
        objectWillChange.send()
    }

    func resetGame() {
        game = BattleshipGame.newGame()
        shotsFired = 0
        hits = 0
        isGameOver = false
        statusMessage = "New game: tap a square to fire!"
    }
}
