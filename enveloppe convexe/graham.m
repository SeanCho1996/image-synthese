clc
clear

% intialize randomly 5 points
n = 30;
points = rand(n, 2)*100;
p_index = 1:n;

% draw points
figure
plot(points(:,1), points(:,2), 'bx')
hold on

index = 1;
for i = 1:n
    if(points(i,2) < points(index,2) || (points(i,2) == points(index,2) && points(i,1) < points(index,1)))
        index = i;
    end
end
points([1 index],:) = points([index 1], :);
hull = [];
hull = [hull, points(1,:)];
hull(1,3) = 0;
for i = 2:n
    points(i,3) = calcul_poleangle(points(1,:), points(i,:));
end
points = sortrows(points, 3);
hull = [hull; points(2,:); points(3,:)];
top = 3;
for i = 4:n
    while top>1 && (cal_crossproduct(hull(top-1,:),points(i,:),hull(top,:))>=0)
        hull(top,:) = [];
        top = top-1;
    end
    hull = [hull; points(i,:)];
    top = top+1;
end
hull = [hull; points(1,:)];
plot(hull(:,1),hull(:,2),'r')