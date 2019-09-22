
# STEP BY STEP GUIDE FOR FLEX INSTALLATION

## Step 1
### For downloading CODEBLOCKS
Open your Browser and type in "codeblocks"
Goto to Code Blocks and go to downloads section
Click on "Download the binary release"
I have already Download codeblocks-16.01mingw-setup.exe
Install the software keep clicking on next


### For downloading FLEX GnuWin32
Open your Browser and type in "download flex gnuwin32"
Goto to "Download GnuWin from SourceForge.net"
Downloading will start automatically
Install the software keep clicking on next
/*SAVE IT INSIDE C FOLDER*/


## Step 2 PATH SETUP FOR CODEBLOCKS
After successful installation Goto program files
Goto CodeBlocks
Goto MinGW
Goto Bin 
Copy the address of bin it should somewhat look like this
C:\Program Files x86\CodeBlocks\MinGW\bin 
Open Control Panel
Goto System
Goto Advance System Settings
Goto Environment Variables
Goto Environment Variables
Click on Path which is inside System variables
Click on edit 
Click on New and paste the copied path to it:-
C:\Program Files x86\CodeBlocks\MinGW\bin 
Press Ok!

## Step 3  PATH SETUP FOR GnuWin32
After successful installation Goto C folder
Goto GnuWin32
Goto Bin 
Copy the address of bin it should somewhat look like this
C:\GnuWin32\bin
Open Control Panel
Goto System
Goto Advance System Settings
Goto Environment Variables
Environment Variables
Click on Path which is inside System variables
Click on edit 
Click on New and paste the copied path to it:-
C:\GnuWin32\bin
Press Ok!
/*WARNING!!! PLEASE MAKE SURE THAT PATH OF CODEBLOCKS IS BEFORE GNUWIN32 
---THE ORDER MATTERS*/

## Step 4
Create a folder on Desktop flex_programs or whichever name you like 
Open notepad type in a flex program
Save it inside the folder like filename.l
/*Make sure while saving save it as all files rather than as a text document*/

## Step 5
Goto to Command Prompt(cmd)
Goto the directory where you have saved the program
Type in command :-  flex filename.l
Type in command :- gcc lex.yy.c
Execute/Run for windows command promt :-     a.exe     

## Instruction taken
https://codedost.com/flex/

## Video lesson
https://www.youtube.com/watch?v=ilwXAchl4uw