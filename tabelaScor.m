function [] = tabelaScor(s,scorTu,scorPC)
		% functie ce modifica scorul
	
		%tratez separat cazul de egalitate si cazul in care castiga 
				%calculatorul
		%utilizatorul nu castiga niciodata
		if (s == 'd')	%daca e egalitate
		% tai scorul precedent si modific axele
			x = [2.1, 2.5]';
			y = [1.6, 1.6];
			plot(x,y,"color",'r'),axis equal,axis([-1.5,3, -1.5,3]);
			x = [2.1, 2.5]';
			y = [1.2, 1.2];
			plot(x,y,"color",'r');
			%scriu noul scor
			text(2.7,1.6,num2str(scorTu),"fontsize",20);
			text(2.7,1.2,num2str(scorPC),"fontsize",20);
			
		else	%analog
			x = [2.1, 2.5]';
			y = [1.2, 1.2];
			plot(x,y,"color",'r'),axis equal,axis([-1.5,3, -1.5,3]);
			text(2.7,1.2,num2str(scorPC),"fontsize",20);
		endif		
endfunction
