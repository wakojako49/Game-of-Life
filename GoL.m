clear all
clc

%defines the size of the neighbourhood
len = 50; 
GRID = int8(rand (len, len ));
nGRID = GRID;
for i = 1:100; %number of iteration of GoL
	imshow(nGRID);
	for row = 1:len;
		for col = 1:len;
			
			rowPls = row +1 ;
			colPls = col + 1;
			rowMin = row - 1;
			colMin = col -1;
			%% checks the if refcell is at corners
			if (rowMin <= 0 && colPls > len)
				N2 = 0;
			else
				N2 = 1;	
			endif
			
			if (rowPls > len && colPls > len)
				N4 = 0;
			else
				N4 = 1;	
			endif
			
			if (rowPls > len && colMin <= 0)
				N6 = 0;
			else
				N6 = 1;	
			endif
			
			if (rowMin <= 0 && colMin <= 0)
				N8 = 0;
			else
				N8 = 1;	
			endif
			%% check if refCell is at edge
			if (row == 1 || col == len || col == 1 || row == len)
				N1 = N3 = N5 = N7 = 0;
			endif
			
			totN = N1 + N2 + N3 + N4 + N5 + N6 + N7 + N8;
			
			if (totN == 2 || totN == 3 )
				nGRID(row, col) = 1;
			else
				nGRID(row, col) = 0;
			endif
			
		end
	end
	nGRID = GRID;
	pause(0.02);
end