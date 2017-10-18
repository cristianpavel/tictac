function m = mutareCalculator(a,x)
	% functie ce face mutarea calculatorului
	% atribui matricii returnate valorile matricii primite pentru
			%a putea afisa grafic rezultatul mutarii la sfarsit
	m = a;
	
	%daca trebuie sa puna 'X' sau '0'
	if (x == 1)
		o = 2;
	else
		o = 1;
	endif
	% gata verifica daca s-a facut mutarea
	gata = 0;
	% curEl este numarul de elemente puse de calculator, 
			%fiecare element punandu-l intr-o matrice cu 2 linii
	curEl = 0;
	% matricea mea e bordata si are dimensiunea 9x9 pentru a face for-uri
	% mai intai verific daca pot sa fac 3 de 'X' sau '0' pe aceeasi line, 
			%coloana sau diagonala
	% de asemenea in matricea com() pun toate elementele puse de calculator
	for i = 4:6
		for j = 4:6
			if (a(i,j) == o) 
				if (a(i,j+1) == o && a(i,j+2) == 0 && j+2 <= 6)
					gata = 1;
					a(i,j+2) = o;
				elseif (a(i,j+2) == o && a(i,j+1) == 0 && j+1 <= 6)
					gata = 1;
					a(i,j+1) = o;
				elseif 	(a(i+2,j+2) == o && a(i+1,j+1) == 0 && j+1 <= 6 && i+1 <= 6)
					gata = 1;
					a(i+1,j+1) = o;
				elseif (a(i+1,j+1) == o && a(i+2,j+2) == 0 && j+2 <= 6 && i+2 <= 6)
					gata = 1;
					a(i+2,j+2) = o;
				elseif 	(a(i+2,j-2) == o && a(i+1,j-1) == 0 && j-1 >= 4 && i+1 <= 6)
					gata = 1;
					a(i+1,j-1) = o;
				elseif (a(i+1,j-1) == o && a(i+2,j-2) == 0 && j-2 >= 4 && i+2 <= 6)
					gata = 1;
					a(i+2,j-2) = o;
				elseif (a(i+1,j) == o && a(i+2,j) == 0 && i+2 <= 6)
					gata = 1;
					a(i+2,j) = o;
				elseif (a(i+2,j) == o && a(i+1,j) == 0 && i+1 <= 6)
					gata = 1;
					a(i+1,j) = o;
				endif
				curEl++;
				com(curEl,1) = i; % retin linia
				com(curEl,2) = j; % retin coloana
			endif
			if (gata == 1)
				break;
			endif
		endfor			
		if (gata == 1)
			break;
		endif
	endfor
	% daca nu am putut sa pun sa castige calculatorul cu 3 consecutive
	if (gata == 0)
		% verific daca trebuie sa-l blochez sa nu faca el 3 consecutive
		% barrier(1,i) = k inseamna ca pe linia i se afla k 
				%elemente puse de utilizator
		% barrier(2,j) = k, pe coloana j sunt k elemente
		% barrier(3,1) = k, pe diaganoala principala
		% barrie(3,2) = k, pe diagonala secundara
		barrier = zeros(3,6);
		for i = 4:6
			for j = 4:6
				if (a(i,j) == x)
				%tratez separat cazul in care calculatorul nu a mutat pana acum
					%adica jucatorul a inceput si PC-ul nu a mutat inca
					if curEl == 0
							%daca mijlocul e ocupat
						if (i == j && i == 5) 
						%pune in stanga sus
							a(4,4) = o;
							gata = 1;
							break;
						else	%pune in mijloc
							a(5,5) = o;
							gata = 1;
						endif
					endif
				%incerc sa-l blochez sa nu faca 3 consecutive	
					if (barrier(1,i) >= 1)
						ok = 0;
						for k = 4:6
							if (a(i,k) == o)
								ok = 1;
							elseif a(i,k) == 0
								a(i,k) = o;
							endif
						endfor
						if ok == 0
							gata = 1;
							break;
						endif
					endif
					if (barrier(2,j) >= 1)
						ok = 0;
						for k = 4:6
							if (a(k,j) == o)
								ok = 1;	
							elseif (a(k,j) == 0)
								a(k,j) = o;
							endif
						endfor
						if ok == 0
							gata = 1;
							break;
						endif
					endif
					if (i == j)
						if (barrier(3,1) >= 1)
							ok = 0;
							for k = 4:6
								if a(k,k) == o
									ok = 1;		
								elseif (a(k,k) == 0)
									a(k,k) = o;
								endif
							endfor
							if ok == 0
								gata = 1;
								break;
							endif
				
						endif
						barrier(3,1)++;
					endif
					if (i + j == 10)
						if (barrier(3,2) >= 1)
							ok = 0;
							for k = 4:6
								if(a(10 - k,k) == o)
									ok = 1;
								elseif (a(10- k,k) == 0)
									a(10 - k,k) = o;
								endif
							endfor
							if ok == 0
								gata = 1;
								break;
							endif
				
						endif
						barrier(3,2)++;
					endif
					barrier(1,i)++;
					barrier(2,j)++;
					
				endif
				if (gata == 1)
					break;
				endif
			endfor			
			if (gata == 1)
				break;
			endif
		endfor
		%daca nu am unde sa-l blochez, incerc sa-l prind
			%putand sa pun la urmatoarea mutare in 2 locuri ca sa fac 3
		if (gata == 0)
			 if(curEl != 0)
				%parcurg lista de elemente ale calculatorului
				for i = 1:curEl
					for j = i+1:curEl
					%pentru fiecare 2 elemente ,verific 
						%daca pot sa pun alt element, ca sa-l prind
						if (barrier(1,com(i,1)) == 0 && barrier(2,com(j,2)) == 0)
							gata = 1;
							a(com(i,1),com(j,2)) = o;
						elseif (barrier(2,com(i,2)) == 0 && barrier(1,com(j,1)) == 0)
							gata = 1;
							a(com(i,2),com(j,1)) = o;
						elseif (com(i,1) == com(i,2))
							if (barrier(3,1) == 0 && barrier(1,com(j,1)) == 0)
								gata = 1;
								a(com(j,1),com(j,1)) = o;
							elseif (barrier(3,1) == 0 && barrier(2,com(j,2)) == 0)
								gata = 1;
								a(com(j,2),com(j,2))= o;
							endif
						
						elseif (com(j,1) == com(j,2))
							if (barrier(3,1) == 0 && barrier(1,com(i,1)) == 0)
								gata = 1;
								a(com(i,1),com(i,1)) = o;
							elseif (barrier(3,1) == 0 && barrier(2,com(i,2)) == 0)
								gata = 1;
								a(com(i,2),com(i,2)) = o;
							endif
						elseif (com(j,1) + com(j,2) ==10)
							if (barrier(3,2) == 0 && barrier(1,com(i,1)) == 0)
								gata = 1;
								a(com(i,1),10 - com(i,1)) = o;
							elseif (barrier(3,2) == 0 && barrier(2,com(i,2)) == 0)
								gata = 1;
								a(10 - com(i,2),com(i,2))= o;
							endif
						elseif (com(i,1) + com(i,2) ==10)
							if (barrier(3,2) == 0 && barrier(1,com(j,1)) == 0)
								gata = 1;
								a(com(j,1),10 - com(j,1)) = o;
							elseif (barrier(3,2) == 0 && barrier(1,com(j,2)) == 0)
								gata = 1;
								a(10 - com(j,2),com(j,2)) = o;
							endif
						endif
						if gata == 1
							break;
						endif
					endfor
					if gata == 1
						break;
					endif
				endfor	
			%daca nu pot sa-l prind incerc sa pun ca sa fac 2 consecutive cu mijlocul
				if (gata == 0)
					if a(5,5) == o
						if (a(5,4) == 0 && barrier(1,5) == 0)
							gata = 1;
							a(5,4) = o;
						elseif a(4,5) == 0 && barrier(2,5) == 0
							gata = 1;
							a(4,5) = o;
						elseif a(5,6) == 0 && barrier(1,5) == 0
							gata = 1;
							a(5,6) = o;
						elseif a(6,5) == 0 && barrier(2,5) == 0
							gata = 1;
							a(6,5) = o;
						endif
					endif
					
			%daca inca nu am pus, incerc sa pun in colturi
				%daca are el in mijloc
				
					if gata == 0
						if (a(5,5) == x)
							if (a(4,4) ==o && a(6,6) == 0)
								a(6,6) = o;
								gata = 1;
							elseif a(6,6) == o && a(4,4) == 0
								a(4,4) = o;
								gata = 1;
							elseif (a(4,6) == 0 && a(6,4) == o)
								a(4,6) = o;
								gata = 1;
							elseif (a(4,6) == o && a(6,4) ==0)
								gata = 1;
								a(6,4) = o;
							endif
					%daca nu are in mijloc pun sa-l prind 
						%la a 2-a mutare a calculatorului
							%cand incepe calculatorul									
						elseif (a(6,4) == 0 && a(5,4) ==0)
							a(6,4) = o;
							gata = 1;
						elseif (a(4,6) == 0)
							a(4,6) = o;
							gata = 1;
						endif
					%daca nu se poate nimic, pun random, se ajunge la egalitate		
						if gata == 0
							i = randi(3) + 3;
							j = randi(3) + 3;
							while(a(i,j)!=0)
								i = randi(3) + 3;
								j = randi(3) + 3;
							endwhile
							a(i,j) = o;
							gata = 1;
						endif
						endif	
					
				endif	
			endif
		endif		
	endif			
	% pun grafic mutarea
	stop = 0;
	for i = 4:6
		for j = 4:6
			if m(i,j) != a(i,j)
				stop = 1;
				break;
			endif
		endfor
		if stop == 1
			break;
		endif
	endfor
	[posx posy] = coordinates(i,j);
	if (o == 1)
		t = 'X';
	else
		t = '0';
	endif
	text(posx,posy,t,"fontsize",20);	
	m = a;
endfunction
