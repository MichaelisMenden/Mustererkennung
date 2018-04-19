function [ ] = Aufgabe1()
a = 0;
b = 5;
clf;
%%Aufgabe 1a
pd = makedist('Uniform','lower',a,'upper',b);
x = -5:0.001:10;
pdf1 = pdf(pd,x);
figure(1);
stairs(x,pdf1,'r','LineWidth',2);
title('Gleichverteilung im Intervall a = 0 und b = 5');

%Aufgabe 1b
Erwartungswert = mean(pd);
disp(['Aufgabe 2a1a) Der Erwartungswert der Gleichverteilung im Intervall a = 0 und b = 5 ist : ' num2str(Erwartungswert)]);

%Aufgabe 1c
Varianz = var(pd);
disp(['Aufgabe 2a1a) Die Varianz der Gleichverteilung im Intervall a = 0 und b = 5 ist : ' num2str(Varianz)]);

%Aufgabe 2
x1 = [1;2];
x2 = [-1;-1];
x3 = [-5;1];
x4 = [1;2];
Vektoren = [x1 x2 x3 x4];

%Aufgabe 2a
Mittelwertsvektor = (x1 + x2 + x3 + x4)/4;
disp(['Aufgabe 2a2a) Der Mittelwertsvektor der gegebenen Vektoren ist X: ' num2str(Mittelwertsvektor(1)) ' Y: ' num2str(Mittelwertsvektor(2))]);

%Aufgabe 2b
Summe = 0;
for i = 1 : 4
    Summe = Summe +  (Vektoren(:,i) - Mittelwertsvektor)*(Vektoren(:,i) - Mittelwertsvektor)';
end
Autokovarianz = Summe / 4;
disp(['Aufgabe 2a2b)Die Autokovarianz der gegebenen Vektoren ist : ']);
Autokovarianz
%Aufgabe 3
MittelwertsvektorU = [0 0];
KovarianzenU = [4 0;0 1];
MittelwertsvektorV = [4 0];
KovarianzenV = [1 0;0 4];

figure(2);
x1 = -20:0.25:20; x2 = -20:0.25:20;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],MittelwertsvektorU,KovarianzenU);
F = reshape(F,length(x2),length(x1));

mvncdf([0 0],[1 1],MittelwertsvektorU,KovarianzenU);
contour(x1,x2,F,[.07 .06 .05 .04]);
xlabel('x'); ylabel('y');
title('Darstellung der multivariaten Normalverteilungen als Kontur(Höhenlinien)')
hold on;

x1 = -20:0.25:20; x2 = -20:0.25:20;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],MittelwertsvektorV,KovarianzenV);
F = reshape(F,length(x2),length(x1));

mvncdf([0 0],[1 1],MittelwertsvektorV,KovarianzenV);
contour(x1,x2,F,[.07 .06 .05 .04]);
xlabel('x'); ylabel('y');
%Trennlinie
line([0 5],[-5 5],'Linestyle','-','Color','r');
legend('Höhenlinien','','Trennfunktion');

%Aufgabe 2b
%Mittelwertsvektor aus Aufgabe 2a3
Mittelwertsvektor = (MittelwertsvektorV + MittelwertsvektorU) / 2;
KVM = KovarianzenU * KovarianzenV;
%3D Oberfläche einer Multivariaten Normalverteilung
figure(3);
x = [-10:0.1:10];
y = [-10:0.1:10];
[X Y] = meshgrid(x,y);
F = mvnpdf([X(:) Y(:)],Mittelwertsvektor,KVM);
F = reshape(F,length(y),length(x));
surf(x,y,F);
xlabel('x'); ylabel('y');
title('3D Plot für Mittelwertsvektor aus Aufgabe 2a3');
%Konturbild
figure(4);
contour(X,Y,F,[.03 .01 .005 .001]);
xlabel('x'); ylabel('y');
title('Konturbild für Mittelwertsvektor aus Aufgabe 2a3');
%Random Samples
figure(5);
R = chol(KVM);
z = repmat(Mittelwertsvektor,1000,1) + randn(1000,2)*R;
plot(z(:,1),z(:,2),'b*');

%Normalverteilung mit sehr viel stärkerer y-Streuung als X Streuung
Mittelwertsvektor = [10 5];
KVM = [1 0;0 20];
%3D Oberfläche einer Multivariaten Normalverteilung
figure(6);
x = [0:0.1:15];
y = [-10:0.1:20];
[X Y] = meshgrid(x,y);
F = mvnpdf([X(:) Y(:)],Mittelwertsvektor,KVM);
F = reshape(F,length(y),length(x));
surf(x,y,F);
xlabel('x'); ylabel('y');
title('3D Plot mit starker y-Streuung');
%Konturbild
figure(7);
contour(X,Y,F,[.03 .01 .005 .001]);
xlabel('x'); ylabel('y');
title('Konturbild mit starker Y Streuung');
%Random Samples
figure(5);
hold on;
R = chol(KVM);
z = repmat(Mittelwertsvektor,1000,1) + randn(1000,2)*R;
plot(z(:,1),z(:,2),'r*');

%Normalverteilung mit sehr breiter Streuung in X und Y Richtung
Mittelwertsvektor = [0 10];
KVM = [25 0;0 25];
%3D Oberfläche einer Multivariaten Normalverteilung
figure(8);
x = [-10:0.1:10];
y = [-10:0.1:20];
[X Y] = meshgrid(x,y);
F = mvnpdf([X(:) Y(:)],Mittelwertsvektor,KVM);
F = reshape(F,length(y),length(x));
surf(x,y,F);
xlabel('x'); ylabel('y');
title('3D Plot mit sehr breiter Streuung in X und Y Richtung');
%Konturbild
figure(9);
contour(X,Y,F,[.006 .004 .002 .001]);
xlabel('x'); ylabel('y');
title('Konturbild mit sehr breiter Streuung in X und Y Richtung');
%Random Samples
figure(5);
hold on;
R = chol(KVM);
z = repmat(Mittelwertsvektor,1000,1) + randn(1000,2)*R;
plot(z(:,1),z(:,2),'g*');
title('2D Verteilung zufälliger Samples');
xlabel('x');ylabel('y');
legend('Mittelwertsvektor 2a3','Breite Y Streuung', 'Breite Streuung in X und Y Richtung');
end

