clear; clc;
close all;
tic;

syms x1 x2 y1 y2 vx1 vx2 vy1 vy2

J = 1000;
T = 950;
tau = T/(J - 1);
lamda = -1000000;

%НУ 
q1=1;q2=-1;Q=1;m=1;k=1;
l = 0.5;
r = 5;
x10=10; x20=10; y10=l/2; y20=-l/2; vx1_0=0; vx2_0=0; vy1_0=0; vy2_0=0;

N=9; %количество переменных: 8 координат, 1 расстояние м/у дипольчиками

E=eye(N);
E(N,N)=0; %матрица для вычислений

[Fu,var] = yakobian(l); %функция для подсчета якобиана
F_u = @(X) double(subs(Fu,var,X));

U(1,:)=[r; l/2; 0; 0; r; -l/2; 0; 0; lamda];
%U(1,:)=[x1 y1 vx1 vy1 x2 y2 vx2 vy2 lamda]; 

a = (1+1i)/2;

for i=1:J-1
    %             l       x1     x2    y1     y2
    nach_usl = [U(i,9) U(i,1) U(i,5) U(i,2) U(i,6)];
    Fu = F_u(nach_usl);
    F = F_pr_ch( U(i,:), l);
    w =  ( E - tau*a*Fu ) \ F';
    U(i+1,:) = U(i,:) + tau*real(w');
end
    
X1 = U(:,1);
Y1 = U(:,2);
X2 = U(:,5);
Y2 = U(:,6);

figure(1);
plot(X1,Y1,'*');
hold on;
plot(X2,Y2,'g*');
%line ([X1 X2], [Y1 Y2]);
axis([0 (r+1) -0.5 0.5]);
%axis equal tight
hold on;
plot(0,0,'ko');

xlabel('X');
ylabel('Y');
title('Диполь в поле заряда');
legend('+','-','заряд в центре');

fig = figure();
% создание первого пустого кадра
set(fig,'Position',[350,200,700,300]);
axes('xlim',[0 (r+1)],'ylim',[-0.5 0.5],'NextPlot','add','Parent',fig);
frame = getframe(fig);
[im,map] = rgb2ind(frame.cdata,4);
imwrite(im,map,'animation2.gif','DelayTime',0,'Loopcount',0);

% цикл анимации
for i=1:J 
    plot(X1(i),Y1(i),'.');
    plot(X2(i),Y2(i),'r.');

    frame = getframe(fig);
    [im,map] = rgb2ind(frame.cdata,4);
    imwrite(im,map,'animation2.gif','DelayTime',0.1,'WriteMode','Append');
end;