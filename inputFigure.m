function [y start] = inputFigure()
	%functie ce afiseaza grafic meniul
	
	%f o figura redimensionata
	f = figure("Position",[300,400,400,150]);
	
	%pozitionam axele
	axis([-1,2 -1,2]);
	axis off;

	%afisam textul
	text(-0.5,1.5,'Choose your preference',"fontsize",20);
	text(-0.25,0.5,'X',"fontsize",20);
	text(1.25,0.5,'0',"fontsize",20);
	y = 0;
	%in functie de unde apasa utilizatorul, modificam variabila y
	while y == 0
	[posx posy] = ginput(1);
	if (posx <= 0 && posx >= -0.30 && posy >= 0.1 && posy <= 0.8)
		y = 1;
	elseif (posx<= 1.5 && posx >= 1.2 && posy >=0.1 && posy <= 0.8)
		y = 2;
	endif
	endwhile
	%stergem figura
	clf;
	%pozitionam din nou axele
	axis([-1,2 -1,2]);
	axis off;
	text(-0.5,1.5,'Do you want to move first?',"fontsize",20);
	
	text(-0.25,0.5,'Yes',"fontsize",20);
	text(1.25,0.5,'No',"fontsize",20);
	start = 0;
	%in functie de unde apasa utilizatorul, modifica start
	while start == 0
	[posx posy] = ginput(1);
	if (posx <= 0 && posx >= -0.30 && posy >= 0.1 && posy <= 0.8)
		start = 1;
	elseif (posx<= 1.5 && posx >= 1.2 && posy >=0.1 && posy <= 0.8)
		start = 2;
	endif
	endwhile
	%inchidem figura	
	close(f);
endfunction
	
