function [r x y] = smallest_circle_passing_3p(p1,p2,p3)

%??????
 center1=(p1(:)+p2(:))/2;%%??
 center2=(p2(:)+p3(:))/2;
 
 k1=-1/((p2(2)-p1(2))/(p2(1)-p1(1)));%??
 k2=-1/((p3(2)-p2(2))/(p3(1)-p2(1)));
 
 b1=center1(2)-k1*center1(1);%?????
 b2=center2(2)-k2*center2(1);
 
 %???
x = -(b1-b2)/(k1-k2);   %??????
y = -(-b2*k1+b1*k2)/(k1-k2);
%???
r = sqrt((x-p1(1))^2+(y-p1(2))^2);