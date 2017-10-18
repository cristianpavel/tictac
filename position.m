function [i j] = position(x,y)
	i = -1;
	j = -1;
	if (x <= 0 && x>= -0.5)
		if (y >= 1 && y <= 1.5)
			i = 4;
			j = 4;
		elseif (y >= 0.5 && y <= 1)
			i = 5;
			j = 4;
		elseif (y >= 0 && y <= 0.5)
			i = 6;
			j = 4;
		endif
	elseif (x <= 0.5 && x >=0)
		if (y >= 1 && y <= 1.5)
			i = 4;
			j = 5;
		elseif (y >= 0.5 && y <= 1)
			i = 5;
			j = 5;
		elseif (y >= 0 && y<= 0.5)
			i = 6;
			j = 5;
		endif
	elseif (x<= 1 && x >= 0.5)
		if (y >= 1 && y <= 1.5)
			i = 4;
			j = 6;
		elseif (y >= 0.5 && y <= 1)
			i = 5;
			j = 6;
		elseif (y >=0 && y <= 0.5)
			i = 6;
			j = 6;
		endif
	endif
	if (x >= 1.3 && x <= 2 && y <= -0.9 && y >= -1.1)
                i = -2;
		j = -2;
        endif	
endfunction
			
