len = 50; 
GRID = int8(rand (len, len ));
minusOne = len-1;
up = [2:len 1]; down = [len 1: (minusOne)];

for i = 1 : 100;
	neighbours = GRID(up, :) + GRID(down , :) + GRID(:, up) + GRID(:, down) + GRID(up , up) + GRID(up, down) + GRID(down, up) + GRID(down, down);

GRID = neighbours == 3 | GRID & neighbours == 2;
imshow(GRID); pause(0.02);
end