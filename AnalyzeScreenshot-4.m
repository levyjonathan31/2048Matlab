function [board] = AnalyzeScreenshot(filename)
pix = imread(filename);
[h,w,c] = size(pix);
% Initializes the varialbes for the corner of the 2048 box
cX = 0;
cY = 0;
% Initializes empty vector to put numerical values into
vec = [];
for ii = 1:1:h
   % breaks outer loop if corner has been found
    if cX ~= 0
        break
    end
    for jj = 1:1:w
        if pix(ii,jj,1) == 187 && pix(ii,jj,2) == 173 && pix(ii,jj,3) == 160
           cX = ii; 
           cY = jj;
           % breaks inner loop if corner has been found
           break;
        end
    end
end
% Double four loop to determine color of each square (only checks red and
% green as checking blue is redundant in this case)
for jj = 20:120:500
    for ii = 20:120:500
        if pix(cX + jj, cY + ii, 1) == 238 && pix(cX + jj, cY + ii, 2) == 228
            % Checks for red green for square 2 in position and inserts 2
            % into vector if true
            vec = [vec 2];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 224
            % Checks for red green for square 4 in position and inserts 4
            % into vector if true
            vec = [vec 4];
        end
        if pix(cX + jj, cY + ii, 1) == 242 && pix(cX + jj, cY + ii, 2) == 177
            % Checks for red green for square 8 in position and inserts 8
            % into vector if true
            vec = [vec 8];
        end
        if pix(cX + jj, cY + ii, 1) == 245 && pix(cX + jj, cY + ii, 2) == 149
            % Checks for red green for square 16 in position and inserts 16
            % into vector if true
            vec = [vec 16];
        end
        if pix(cX + jj, cY + ii, 1) == 246 && pix(cX + jj, cY + ii, 2) == 124
            % Checks for red green for square 32 in position and inserts
            % 32 into vector if true
            vec = [vec 32];
        end
        if pix(cX + jj, cY + ii, 1) == 246 && pix(cX + jj, cY + ii, 2) == 94
            % Checks for red green for square 64 in position and inserts
            % 64 into vector if true
            vec = [vec 64];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 207
            % Checks for red green for square 128 in position and inserts
            % 128 into vector if true
            vec = [vec 128];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 204
            % Checks for red green for square 256 in position and inserts
            % 256 into vector if true
            vec = [vec 256];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 200
            % Checks for red green for square 512 in position and inserts
            % 512 into vector if true
            vec = [vec 512];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 197
            % Checks for red green for square 1024 in position and inserts
            % 1024 into vector if true
            vec = [vec 1024];
        end
        if pix(cX + jj, cY + ii, 1) == 237 && pix(cX + jj, cY + ii, 2) == 194
            % Checks for red green for square 2048 in position and inserts
            % 2048 into vector if true
            vec = [vec 2048];
        end
        if pix(cX + jj, cY + ii, 1) == 205 && pix(cX + jj, cY + ii, 2) == 193
            vec = [vec 0];
        end
    end
end
% Converted 1 dimensional vector of length 16 to a 2 dimensional vector
% with 4 rows and 4 columns
matrix = [vec(1:4); vec(5:8); vec(9:12); vec(13:16)];
% Sets return value to the 4x4 matrix
board = matrix;
end

