%Project 2048 Test File
clc; clear;

name = input('Enter the name of the image: ', 's');

board_game1 = AnalyzeScreenshot(name);
disp(board_game1);

direction = input('Enter up, down, left, right: ', 's');
[new_board2, b] = MakeMove(board_game1,direction);
disp(new_board2);
fprintf('The score is %g! \n', b);







