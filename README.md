# Battleship Game – SwiftUI Final Project

This is a single-player Battleship game built using SwiftUI. The player selects a difficulty level and tries to sink all hidden ships on an 8×8 grid before running out of shots. Ship positions are randomized each time a new game starts.

## Features

- Two difficulty modes: Easy and Hard  
- 8×8 dynamic game board  
- Random ship placement on each new game  
- Hit and miss detection  
- Shot and hit counters  
- Animated button press effects  
- Animated grid cell tap effect  
- Reset game option  
- Custom app icon and home screen image  

## Architecture

The project follows the MVVM architecture.

**Model – Model.swift**  
Contains all core game data structures and logic:
- `BattleshipGame` – main game logic (grid setup, firing, win/loss checks)  
- `CellState` – represents the state of each cell (unknown, hit, miss)  
- `Coordinate` – represents a position on the grid  
- `HitResult` – represents the result of a shot (hit, miss, already tried)  

**ViewModel – BattleshipViewModel.swift**  
Manages the game state and connects the model to the views:
- Stores the current game instance  
- Tracks shots fired, hits, and remaining shots  
- Updates status messages  
- Handles user input from the grid  
- Controls game reset and difficulty settings  

**Views – ContentView.swift, GameView.swift**  
Handles the user interface:
- `ContentView` – home screen with title, difficulty selection, and navigation  
- `GameView` – main gameplay screen with status text, stats, grid, and reset button  
- `CellView` (inside `GameView`) – draws each individual grid cell based on its state  

## How to Play

1. Launch the app.  
2. Select a difficulty level (Easy or Hard).  
3. Tap on the grid to fire a shot.  
4. Red squares indicate hits, gray squares indicate misses.  
5. Sink all ships before running out of shots to win.  
6. Use the Reset Game button to start a new game.  

## Technologies Used

- Swift  
- SwiftUI  
- Xcode  
- Figma (for app icon and image design)  

## How to Run

1. Clone the repository.  
2. Open the project in Xcode.  
3. Select an iPhone simulator.  
4. Run the project.  

## Course Information

CIS 137 – iOS/Swift Programming  
Student: Esmira Babayeva  
Instructor: Hellen Pacheco  

## License

This project was created for educational purposes.
