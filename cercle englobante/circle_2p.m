function [r,x,y] = circle_2p(p1,p2)
x = (p1(1)+p2(1))/2;
y = (p1(2)+p2(2))/2;
r = sqrt((x-p1(1))^2 + (y-p1(2))^2);