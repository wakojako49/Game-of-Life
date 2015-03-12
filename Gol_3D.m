clear all;
clc;

%defines the size of the neighbourhood
% len = 50; 
% nHood = int8(rand (len, len ));

width = 10;
length = 20;
nHood = int8(rand (width, length ));
nStep = 100;%number of iteration of GoL

for i = 1:nStep; 
	%Define the neighbours 1 = neighbours, 0 = self
  neighbours = conv2( nHood, [1 1 1;1 0 1; 1 1 1], 'same' );
  %calculates number of neighbours and determin if cell lives/dies
	nHood = nHood.*( neighbours == 2 | neighbours == 3 ) + ( 1 - nHood ).*( neighbours == 3 );
	array(:,:,i) = nHood;
  [x,y,z]=ind2sub(size(array), find(array));
  
  scatter3(x(:),y(:),z(:),[],z(:),'filled');
  axis([0 width 0 length 0 nStep])
  view(40+i,35)
	pause(0.3);
end 

