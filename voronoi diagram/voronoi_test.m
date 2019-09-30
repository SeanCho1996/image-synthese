clc;
clear;

% define points
points = 100*rand(5,2);
% figure
% plot(points(:,1), points(:,2), 'bx');

% calculate voronoi diagram and delaunay triangulation
[vx, vy] = voronoi(points(:, 1), points(:, 2));
TRI = delaunay(points(:, 1), points(:, 2));
figure
subplot(121)
plot(points(:,1), points(:,2), 'rx', vx, vy, 'b-');
hold on
triplot(TRI,points(:,1), points(:,2), 'g-')
hold off

hull = func_graham(points);
subplot(122)
plot(points(:,1), points(:,2), 'bx');
hold on
plot(hull(:,1),hull(:,2),'r');
