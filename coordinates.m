function [x y] = coordinates(i,j)
	if i == 4
		if j == 4
			x = -0.30;
			y = 1.25;
		elseif j == 5
			x = 0.20;
			y = 1.25;
		else
			x = 0.70;
			y = 1.25;
		endif
	elseif i == 5
		if j == 4
			x = -0.30;
			y = 0.75;
		elseif j == 5
			x = 0.20;
			y = 0.75;
		else
			x = 0.70;
			y = 0.75;
		endif
	else
		if j == 4
			x = -0.30;
			y = 0.25;
		elseif j == 5
			x = 0.20;
			y = 0.25;
		else
			x = 0.70;
			y = 0.25;
		endif
	endif
endfunction
