# Description:
PERIOD 4

Ethan Lijin, Skylar Huang

Jelly Debuggers

Candy Crush: The player has to drag different pieces of candy to make consecutive threes in rows or columns to eliminate the candy and get a higher score. When the candy is eliminated, the board automatically updates by randomly adding 3 more candies from the top of the screen so that all the candy is shift down by one depending on which 3 candies were eliminated. Combos of 4 or 5 result in higher scores an the game ends when there are no more possible matches to be made.

Minimum Viable Product: A completed initial board of randomized colored circles that updates when three of the same color are matched. The initial board should consist of equally spaced tiles and be filled with circles at setup. There will also be a score keeper that updates automatically and a reset button that resets the board and sets score back to 0.

# Technical Details:

We'll be using classes, constructors to initialize candies, and methods to display/swap them. The game grid will be represented by a 2D array where each cell holds a Candy object. There will be multiple if statements present in each method to verify if a move is valid or if the board should update each time a move is made.

# Project Design
![Old UML Diagram](classes.png?raw=true "Classes" )
![Old2 UML Diagram](classes2.png?raw=true "Classes" )
Old UML Diagrams above (Please refer to the new UML diagram below)
![New UML Diagram](finaluml.png?raw=true "Classes" )

Game contains one Board and one Points object.
Board is a grid (Tile[][]) where each Tile contains a Candy.
Candy objects are created with random colors and types (normal, striped, etc.).
Points is updated based on match types (3, 4, 5 combos).

Board.checkMatches()
- Loops through all rows and columns to find sequences of 3+ matching candies.
- Uses nested loops and Candy.equals().

Board.clearMatches()
- Sets matching tiles' candies to null.

Board.dropCandies()
- Moves all non-null candies down into empty spaces.

Board.refillBoard()
- Fills empty tiles with new Candy objects.

Game.mousePressed()
- Detects which tile is clicked, selects or swaps it.
- After a valid move: Calls checkMatches(), clearMatches(), dropCandies(), refillBoard(), and updates Points


# Intended pacing:
Phase 1 (5/22/2025):
&nbsp;
- create files with with the methods (Skylar)
- discuss if any other new methods, classes, or instance variables are needed.

Phase 2 Candy and Tile class (5/27/2025):
&nbsp;
- Implement the candy class (Ethan) : initialize candies on the board randomly 
- Implement the tile class (Skylar) : add select & deselect methods for matches & swaps

Phase 3 Board and Points class(5/30/2025):
&nbsp;

## Ethan:
- Board Class: checks user input to make matches
- implement initialize
- implement display
- implement swap(t1: Tile, t2: Tile)
- implement checkMatches(): boolean
- implement clearMatches()
&nbsp;
- ~implement Points class~
~&nbsp;

## Skylar:
- ~Board class~:
- ~implement dropCandies()~
- ~implement refillBoard()~
- ~implement hasMoves(): boolean~
- implement Points class : keeps track of the score

Phase 4 Game file ~(6/2/2025)~:
&nbsp;

## Skylar:
- ~implement setup()~
- ~implement draw()~
- ~implement mousePressed()~
- finish game class : editing updateGame & mousePressed for efficiency
- add game states

&nbsp;
## Ethan:
- ~implement resetGame()~
- ~implement updateGame()~
- ~implement gameOver(): boolean~
- finish boardclass: checking for matches and dropping candies

phase 5 ~(6/5/2025)~ (6/7/2025 - 6/9/2025):
&nbsp;
- double check everything to make sure everything is working
- Skylar: ~implement win/lose conditions~
- Ethan: ~implement end of game dialogue~
- Skylar: implement main menu & background
- Skylar: implement delay in matches for visible functionality
- Ethan: implement candy images getting displayed on board
- Ethan: implement falling candy animation

