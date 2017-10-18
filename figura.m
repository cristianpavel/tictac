function [] = figura(a,b)
	% functie ce face tabela de joc
	
	% definesc axele cu originea in (-1,-1), tabela o construim
			%simetric fata de origine
	axis equal,axis([-1,2, -1,2]);
	% desenez liniile tablei de joc
	x = [0.5, 0.5]';
	y = [1.5, 0];
	plot(x,y);
	hold on;	%sa nu stearga ce am desenat pana acum
	axis off;	%sa face axele invizibile
	x = [0, 0]';
	plot(x,y);
	y = [1, 1];
	x = [-0.5, 1]';
	plot(x,y);
	y = [0.5,0.5];
	plot(x,y);

	%desenez deptunghiul butonului de 'Quit'
	x = [1.3,2,2,1.3,1.3]';
	y = [-1.1,-1.1,-0.90,-0.90,-1.1];
	% schimb axele ca sa pun butonul de Quit mai usor in figura
	axis equal,axis([-1.5,2 -1.5,2]);
	plot(x,y);
	%scriu tabela de scor si textul butonului de Quit
	text(2,2,"Scor","fontsize",20);
	text(1.8,1.6,"Tu","fontsize",20);
	text(1.8,1.2,"PC","fontsize",20);
	text(2.2,1.6,num2str(a),"fontsize",20);
	text(2.2,1.2,num2str(b),"fontsize",20);
	text(1.5,-1,"Quit","fontsize",15);
endfunction
