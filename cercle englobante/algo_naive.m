clc
clear

points = rand(3,2)*100;
figure
plot(points(:,1),points(:,2),'bx')
hold on

[r,x,y] = smallest_circle_passing_3p(points(1,:),points(2,:),points(3,:));
rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1,'EdgeColor', 'r'),axis equal
[r,x,y] = circle_2p([0 0],[2 2]);
rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1,'EdgeColor', 'y'),axis equal