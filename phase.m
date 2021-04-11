% Potret Fase Model Mangsa Pemangsa
% Membersihkan window
clear all; close all; clc


%inisialisasi
[x1, x2] = meshgrid(1:5:100, 1:5:100);
a1 = 0.3;
a2 = 0.2;
b11 = 0.002;
b12 = 0.004;
b21 = 0.001;
b22 = 0.003;
waktu = [0, 100];

% Plot isoclines dan lintasan bidang fase untuk memodelkan sistem persamaan:
x1dot = x1.*(a1-b11.*x1-b12.*x2);
x2dot = x2.*(a2-b21.*x1-b22.*x2);

% Membuat plot vektor dan quiver
figure (1);
quiver(x1,x2,x1dot, x2dot, 'r');


% Mendefinisikan model
f = @(t,y) [y(1).*(a1-b11.*y(1)-b12.*y(2)); y(2).*(a2-b21.*y(1)-b22.*y(2))];

hold on

% Menghitung fase potrait untuk kondisi awal yang berbeda dan plot lintasan fase 

for y0=0:10:100
	[ts, ys] = ode45(f, waktu, [y0/2, y0]);
	plot(ys(:,1), ys(:,2),'k','Linewidth',2.0)
	plot(ys(1,1),ys(1,2),'go','Linewidth',2.0) % starting point
	plot(ys(end,1),ys(end,2),'rs','Linewidth',2.0) % ending point
end

hold off

xlabel('Jumlah Populasi (N)');
ylabel('Jumlah Populasi (M)');
