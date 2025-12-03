Battleship Game – SwiftUI Final Project

This is a single-player Battleship game built using SwiftUI. The player selects a difficulty level and tries to sink all hidden ships on an 8×8 grid before running out of shots. Ship positions are randomized each time a new game starts.

Features:

Two difficulty modes: Easy and Hard

8×8 dynamic game board

Random ship placement on each new game

Hit and miss detection

Shot and hit counters

Animated button press effects

Animated grid cell tap effect

Reset game option

Custom app icon and home screen image


Architecture:

The project follows the MVVM architecture.

Model: BattleshipGame, CellState, Coordinate, HitResult

ViewModel: BattleshipViewModel

Views: ContentView, GameView (includes CellView)

How to Play:

Launch the app.

Select a difficulty level (Easy or Hard).

Tap on the grid to fire a shot.

Red squares indicate hits, gray squares indicate misses.

Sink all ships before running out of shots to win.

Use the Reset Game button to start a new game.

Technologies Used:

Swift

SwiftUI

Xcode

Figma (for app icon and image design)

How to Run:

Clone the repository.

Open the project in Xcode.

Select an iPhone simulator.

Run the project.

Course Information:

CIS 137 – iOS/Swift Programming
Student: Esmira Babayeva
Instructor: Hellen Pacheco

License:

This project was created for educational purposes.
