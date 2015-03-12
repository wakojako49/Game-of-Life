%defines the size of the neighbourhood
len = 50; 
GRID = int8(rand (len, len ));
nGRID = GRID;
for i = 1:100; %number of iteration of GoL
	for row = 1:len;
		for col = 1:len;
			rowPls = row +1 ;
			colPls = col + 1;
			rowMin = row - 1;
			colMin = col -1;
			
			if (row == 1 && col == 1)
				totN = GRID(row, colPls) + GRID(rowPls, colPls) + GRID(rowPls, col);
			elseif (row == 1 && col == 5)
				totN = GRID(row, colMin) + GRID(rowPls, colMin) + GRID(rowPls, col);
			elseif (row == 5 && col == 5)
				totN = GRID(rowMin, col) + GRID(rowMin, colMin) + GRID(row, colMin);
			elseif (row == 5 && col == 1)
				totN = GRID(rowMin, col) + GRID(rowMin, colPls) + GRID(row, colPls);
			elseif (row == 1 && col > 1 && col < len)
				totN = GRID(row, colMin) + GRID(rowPls, colMin) + GRID(rowPls, col) +  GRID(rowPls, colPls) +  GRID(row, colPls);
			elseif (row == len && col > 1 && col < len)
				totN = GRID(row, colMin) + GRID(rowMin, colMin) + GRID(rowMin + col) +  GRID(rowMin, colPls) +  GRID(row, colPls);
			elseif (col == 1 && row > 1 && row < len )
				totN = GRID(rowPls, col) + GRID(rowPls, colPls) + GRID(row + colPls) +  GRID(rowMin, colPls) +  GRID(rowMin, col);
			elseif (col == len && row > 1 && row < len)
				totN = GRID(rowPls, col) + GRID(rowPls, colMin) + GRID(row + colMin) +  GRID(rowMin, colMin) +  GRID(rowMin, col);
			elseif (row >1 && row < len && col >1 && col < len)
				totN = GRID(rowPls, col) + GRID(rowPls, colPls) + GRID(row + colPls) +  GRID(rowMin, colPls) +  GRID(rowMin, col) + GRID(rowMin, colMin) + GRID(row, colMin) + GRID(rowPls, colMin);
			endif
			
			if (totN == 2 || totN == 3)
				nGRID(row, col) = 1;
			else
				nGRID(row, col) = 0;
			endif
		end
	end
	imshow(nGRID);
	nGRID = GRID;
end