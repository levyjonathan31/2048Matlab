function [new_board,score] = MakeMove(board,direction)
    % Initializes score as 0
    score = 0;        
    % double for loop to go through every index within the board
    for jj = 1:1:4
        % Creates an empty vector
        tempboard = [];
        for ii = 1:1:4
            if strcmp(direction, 'left')||strcmp(direction, 'right')
                % Puts the row into a separate vector
                if board(jj,ii) ~= 0
                    tempboard = [tempboard board(jj,ii)];
                end
            else
                % Puts the column into a separate vector
                if board(ii,jj) ~= 0
                    tempboard = [tempboard board(ii,jj)];
                end
            end        
        end
            for kk = 2:1:length(tempboard)
                % Checks if two values are the same and next to eachother
                if tempboard(kk) == tempboard(kk-1)
                    % Adds sum of combination (2 times individual) to score
                    % Places sum in the lowest index of the two parts
                    % Replaces higher index of two parts with 1 (temporary)
                    % Ensures numbers dont combine multiple times
                    tempboard(kk-1) = 2*tempboard(kk);
                    score = score + 2*tempboard(kk);
                    tempboard(kk) = 1;
                end
            end
            % Replaces all 1's with empty
            for rr = length(tempboard):-1:2
                if tempboard(rr) == 1
                   tempboard(rr) = [];
                end
            end
            
            for ii = length(tempboard)+1:1:4
                % Fills empty vector spots (out of 4) with 0s depending on
                % direction being moved
                if strcmp(direction, 'left')||strcmp(direction, 'up')
                    tempboard = [tempboard 0]; 
                else
                    tempboard = [0 tempboard];
                end
            end
        % Replaces each row/column with new vector depending on chosen direction    
        if strcmp(direction, 'left')||strcmp(direction, 'right')
            board(jj:4:13+jj) = tempboard(1:4); 
        else
            board((4*jj-3):1:4*jj) = tempboard(1:4);
        end
    end
% Sets return value to board    
new_board = board;
end

