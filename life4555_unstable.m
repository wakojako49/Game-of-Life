clear all; clc;

%defines the size of the neighbourhood
% len = 50; 
% nHood = int8(rand (len, len ));

width = 50;
length = 100;
height = 100;
nHood = int8(rand (width, length, height));

convArray = [1 1 1;1 1 1; 1 1 1];
convArray(:, :, 2) = [1 1 1;1 0 1; 1 1 1];
convArray(:, :, 3) = [1 1 1;1 1 1; 1 1 1];

for i = 1:100; %number of iteration of GoL
	neighbours = convn( nHood, convArray, 'same' );
	nHood = nHood.*( neighbours == 4 | neighbours == 5 ) + ( 1 - nHood ).*( neighbours == 5 );
  [x,y,z]=ind2sub(size(nHood), find(nHood));
  scatter3(x,y,z);
  
  %image(nHood*10);
	%pause(0.02);
end 

