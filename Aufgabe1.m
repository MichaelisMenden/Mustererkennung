function [ ] = Aufgabe1()
a = 0;
b = 5;

%%Aufgabe 1a
pd = makedist('Uniform','lower',a,'upper',b);
x = -5:0.5:10;
pdf1 = pdf(pd,x);
figure(1);
stairs(x,pdf1,'r','LineWidth',2);
Wert = 1

%Aufgabe 1b
Erwartungswert = mean(pd)

%Aufgabe 1c
Varianz = var(pd)


%Aufgabe 2
x1 = [1;2];
x2 = [-1;-1];
x3 = [-5;1];
x4 = [1;2];
Vektoren = [x1 x2 x3 x4];

%Aufgabe 2a
Mittelwertsvektor = (x1 + x2 + x3 + x4)/4;


%Aufgabe 2b
Summe = 0;
for i = 1 : 4
    Summe = Summe +  (Vektoren(:,i) - Mittelwertsvektor)*(Vektoren(:,i) - Mittelwertsvektor)';
end
Autokovarianz = Summe / 4

%Aufgabe 3
MittelwertsvektorU = [0;0];
KovarianzenU = [4 0;0 1];
MittelwertsvektorV = [4;0];
KovarianzenV = [1 0;0 4];



end

