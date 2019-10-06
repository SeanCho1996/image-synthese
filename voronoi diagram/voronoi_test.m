% clc;
% clear;

% define points
% points = 100*rand(5,2);
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

hull_inf = [];
hull_sup = [];
inf = 0;
sup = 0;
for i = 1: size(hull, 1)-1
    k = (hull(i+1, 2) - hull(i, 2))/(hull(i+1, 1) - hull(i, 1));
    b = hull(i+1, 2) - hull(i+1, 1)*k;
    for j = 1:size(hull, 1)-1
        if hull(j, 2) <= k*hull(j, 1) + b
            inf = inf+1;
        end
        if hull(j, 2) >= k*hull(j, 1) + b
            sup = sup+1;
        end
    end
    if inf == size(hull, 1)-1
        hull_inf = [hull_inf; hull(i,1:2); hull(i+1,1:2)];
    elseif sup == size(hull, 1)-1
        hull_sup = [hull_sup; hull(i,1:2); hull(i+1,1:2)];
    end
    inf = 0;
    sup = 0;
end
plot(hull_inf(:,1),hull_inf(:,2), 'g');
plot(hull_sup(:,1),hull_sup(:,2), 'y');