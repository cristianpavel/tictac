function [] = joc()
	% joc X si O cu interfata grafica
	% scor Tu si scor PC 2 variabile de scor
	% gata variabila ce verifica cele 2 cazuri de iesiri din loop
	% functia inputFigure deschide o fereastra prin care jucatorul
			%alege cu ce joaca si daca vrea sa mute primul
	% functia figura face tabla de joc
	% functia position primeste 2 coordonate si da linia si coloana
			%din matricea in care retin tabla de joc
	% functia coordinates primeste o linie si o coloana si returneaza
			%coordonatele mijlocului celulei respective
	% functia mutareCalculator face mutarea calculatorului
	% functia verifica opreste jocul daca cineva a castigat sau in caz
			%de egalitate
	% functia tabelaScor updateaza tabela de scor
	scorTu = 0;
	scorPC = 0;	
	gata = 0;
	while gata != 3	%cat timp utilizatoru nu apasa 'Quit'
		[y start] = inputFigure(); %date de intrare de la utilizator
	
		if y == 1
			x = 'X';
		else
			x = '0';
		endif	
	%m e bordata si are dimensiunea 9x9
		%matricea efectiva este intre 4,4 si 6,6
	m = zeros(9);
	gata = 0;
	f = figure;
	figura(scorTu,scorPC);	%facem tabla de joc
	if (start == 1)
	while (!gata)
			%se primesc input-uri prin apasarea mouse-ului
		[posx posy] = ginput(1); 
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;	%daca se apasa butonul 'Quit'
			break;
		endif
		[line col] = position(posx,posy); %se ia linia si coloana
			%cat timp nu se apasa in interiorul tablei de joc				 	%sau pe Quit si celula nu e libera
		while (line < 0 || m(line,col) != 0) 
			[posx posy] = ginput(1);
			if (line == -2)
				gata = 3;
				break;
			endif
			[line col] = position(posx,posy);
		endwhile
		if (gata == 3)
			break;
		endif	
		[posx posy] = coordinates(line,col); 
		text(posx,posy,x,"fontsize",20); %se updateaza tabla de joc
		m(line,col) = y; %se updateaza matricea
		gata = verifica(m);  %se verifica daca s-a terminat jocul
		if gata == 2	%Utilizatorul nu poate sa castige
			text(-2,-0.5,"Draw.Press anywhere on screen to continue","fontsize",20);
			scorTu = scorTu + 0.5;
			scorPC = scorPC + 0.5;
			tabelaScor('d',scorTu,scorPC);
			[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
		endif
			break;
		endif
		a = mutareCalculator(m,y); %muta calculatorul
		m = a;	%se updateaza matricea
		gata = verifica(m); %se verifica
		if (gata == 1)	%se trateaza cazurile de terminare a jocului
			
			text(-2,-0.5,"You lost.Press anywhere on screen to continue","fontsize",20);
			scorPC++; 
				%se modifica tabela de scor
			tabelaScor('l',scorTu,scorPC);
				%se trece la jocul urmator
			[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
		endif
			break;
		elseif gata == 2
			text(-2,-0.5,"Draw.Press anywhere on screen to continue","fontsize",20);
			scorTu = scorTu + 0.5;
			scorPC = scorPC + 0.5;
			tabelaScor('d',scorTu,scorPC);
			[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
		endif
			break;
						
		endif
		
	endwhile
	else %daca incepe calculatorul, se procedeaza in mod analog
		if y == 1
			m(4,4) = 2;
			t = '0';
		else
			m(4,4) = 1;
			t = 'X';
		endif
		text(-0.25,1.25,t,"fontsize",20);
	while (!gata)
		[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
			break;
		endif
		[line col] = position(posx,posy);
		while (line < 0 || m(line,col) != 0) 
			[posx posy] = ginput(1);
			if (line == -2)
				gata = 3;
				break;
			endif
			[line col] = position(posx,posy);
		endwhile
		if gata == 3
			break;	
		endif
		[posx posy] = coordinates(line,col);
		text(posx,posy,x,"fontsize",20);
		m(line,col) = y;
		gata = verifica(m);
		if gata == 2
			text(-2,-0.5,"Draw.Press anywhere on screen to continue","fontsize",20);
			scorTu = scorTu + 0.5;
			scorPC = scorPC + 0.5;
			tabelaScor('d',scorTu,scorPC);
			[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
		endif
			break;
		endif
		a = mutareCalculator(m,y);
		m = a;
		gata = verifica(m);
		if (gata == 1)
			
			text(-2,-0.5,"You lost.Press anywhere on screen to continue","fontsize",20);
			scorPC++;
			tabelaScor('l',scorTu,scorPC);
			[posx posy] = ginput(1);
			if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
				gata = 3;
			endif
			break;
		elseif gata == 2
			text(-2,-0.5,"Draw.Press anywhere on screen to continue","fontsize",20);
			scorTu = scorTu + 0.5;
			scorPC = scorPC + 0.5;
			tabelaScor('d',scorTu,scorPC);
			[posx posy] = ginput(1);
		if (posx >= 1.3 && posx <= 2 && posy <= -0.9 && posy >= -1.1)
			gata = 3;
		endif
			break;
						
		endif
	endwhile
	endif	
	close;
	endwhile

	
endfunction			
