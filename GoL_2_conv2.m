%defines the size of the neighbourhood
% len = 50; 
% nHood = int8(rand (len, len ));

width = 50;
length = 100;
nHood = int8(rand (width, length ));

for i = 1:100; %number of iteration of GoL
	neighbours = conv2( nHood, [1 1 1;1 0 1; 1 1 1], 'same' );
	nHood = nHood.*( neighbours == 2 | neighbours == 3 ) + ( 1 - nHood ).*( neighbours == 3 );
	image(nHood*10);
	pause(0.02);
end 

