# Dev Log:

This document must be updated daily every time you finish a work session.

## Skylar Huang

### 2025-05-25 - Implemented Tile Class
Added constructors/instance variables according to the UML diagram for the Tile Class along with select & deselect methods to alter the boolean isSelected (~ 5 minutes). Added a swap method and a display by setting up the board with squares depending on the number of rows and columns, and the tile size. (~ 15 minutes)

### 2025-05-27 - UML Diagram Edits + Implementing Points Class
Edited the old UML diagram to include the specification for a class containing another, (~5 minutes) and started to implement the Points class by adding the add, getScore, and reset method. Currently working on display (~15 minutes).

### 2025-05-28 - Starting to Implement Game Class
Added the constructors in the Game class by calling other classes and added the setup() and draw() method to initialize the game and keep score.

### 2025-05-29 - Added on to Game Class & Fixed Syntax Errors
Added reset & update game in the GameClass as well as mousePressed & gameOver method. Also fixed syntax errors in general and in the Game class because it wasn't compiling.

### 2025-05-29 - Discuss & Debugging
Debugged the Tile & Game class. Discussed extra methods needed for Board class and how to implement them in Game.

### 2025-06-01 - Finishing Game Class & Debugging
Added accessor methods in the Tile class to implement in game class. Edited updateGame() & mousePressed() in game class. Changed parameters in some functions in Game and Board for efficiency. Tested out game (works but needs less types of candy to find more matches)

### 2025-06-02 - Testing
After finalizing some minor changes last night, we tested out the game in class to find matches (next steps are animating & adding images of the candy)

### 2025-06-03 - Working on Animations
Starting to work on animating the candies so candies fall down naturally when matches are made instead of teleporting positions. Added Game State in Game class and instance variables for delaying and animating + if statements when matches are made

### 2025-06-04 - Thinking about the animation
Helped outline in class how to show other blocks disappearing following just one block disapearing. 

### 2025-06-07 - Added Background & Main Menu
Uploaded a candy crush background for the game and the main menu + start button before initializing the game. Changed game window size to add a scorekeeper at the top of the screen. 

### 2025-06-08 - Testing & Debugging
Tested final game with the falling animation. Worked on debugging a NullPointerException for mousePressed during falling game state. Added high score keeper. Edited UML diagram to accurately reflect changes.

I believe this document actively reflects the contributions of my teammate. - Ethan