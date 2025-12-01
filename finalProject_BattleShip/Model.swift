//BattleShip Game
// Model






import Foundation

enum CellState {
    case unknown
    case miss
    case hit
}

struct Coordinate: Hashable {
    let row: Int
    let col: Int
}

enum HitResult {
    case hit
    case miss
    case alreadyTried
}

struct BattleshipGame {
    let size: Int
    private(set) var grid: [[CellState]]
    private(set) var shipPositions: Set<Coordinate>

    init(size: Int = 8, shipLengths: [Int] = [2, 3, 3]) {
        self.size = size
        self.grid = Array(
            repeating: Array(repeating: .unknown, count: size),
            count: size
        )
        self.shipPositions = []
        placeShipsRandomly(lengths: shipLengths)
    }

    mutating func fire(at row: Int, col: Int) -> HitResult {
        let coord = Coordinate(row: row, col: col)

        // Already guessed here?
        if grid[row][col] != .unknown {
            return .alreadyTried
        }

        if shipPositions.contains(coord) {
            grid[row][col] = .hit
            return .hit
        } else {
            grid[row][col] = .miss
            return .miss
        }
    }

    var allShipsSunk: Bool {
        // All ship coordinates must be hit
        shipPositions.allSatisfy { coord in
            grid[coord.row][coord.col] == .hit
        }
    }

    var totalShipParts: Int {
        shipPositions.count
    }

    // MARK: - Private ship placement

    private mutating func placeShipsRandomly(lengths: [Int]) {
        shipPositions.removeAll()

        for length in lengths {
            var placed = false

            while !placed {
                let horizontal = Bool.random()

                if horizontal {
                    let row = Int.random(in: 0..<size)
                    let startCol = Int.random(in: 0...(size - length))
                    let coords = (0..<length).map {
                        Coordinate(row: row, col: startCol + $0)
                    }

                    if coords.allSatisfy({ !shipPositions.contains($0) }) {
                        coords.forEach { shipPositions.insert($0) }
                        placed = true
                    }
                } else {
                    let col = Int.random(in: 0..<size)
                    let startRow = Int.random(in: 0...(size - length))
                    let coords = (0..<length).map {
                        Coordinate(row: startRow + $0, col: col)
                    }

                    if coords.allSatisfy({ !shipPositions.contains($0) }) {
                        coords.forEach { shipPositions.insert($0) }
                        placed = true
                    }
                }
            }
        }
    }

    // Optional: create a new game with fresh ships
    static func newGame(size: Int = 8, shipLengths: [Int] = [2, 3, 3]) -> BattleshipGame {
        BattleshipGame(size: size, shipLengths: shipLengths)
    }
}
