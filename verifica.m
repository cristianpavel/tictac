function gata = verifica(m)
	%functie ce verifica daca s-a terminat jocul
	
	%gata returneaza 1 daca a castigat PC-ul
		%si 2 daca e egalitate
	%cu variabila elLibere verific daca gasesc elemente libere
	gata = 0;
	elLibere = 0;
	
       	for i = 4:6
		for j = 4:6
			if (m(i,j) == 0)
				elLibere = 1;
			endif
			if(m(i,j) == m(i+1,j) && m(i+1,j) == m(i+2,j) && m(i,j) != 0)
				gata = 1;
			elseif (m(i,j) == m(i,j+1) && m(i,j+1) == m(i,j+2) && m(i,j)!=0)
				gata = 1;
			elseif (m(i,j) == m(i+1,j+1) && m(i,j) == m(i+2,j+2) && m(i,j) != 0)
				gata = 1;
			elseif  (m(i,j) == m(i+1,j-1) && m(i,j) == m(i+2,j-2) && m(i,j) != 0)
				gata = 1;
			endif
			if gata == 1
				break;
			endif	
		endfor
		if gata == 1
			break;
		endif
	endfor
	if(elLibere == 0 && gata == 0)
		gata = 2;
	endif
endfunction
