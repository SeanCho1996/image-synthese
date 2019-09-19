clc
clear

% intialize randomly 30 points
n = 30;
points = rand(n, 2)*100;
p_index = 1:n;

% draw points
figure
plot(points(:,1), points(:,2), 'bx')
hold on

index = 1;
% 找到最下方的点，必为凸包上的点
for i = 1:n
    if(points(i,2) < points(index,2) || (points(i,2) == points(index,2) && points(i,1) < points(index,1)))
        index = i;
    end
end
points([1 index],:) = points([index 1], :); %将这个点移到第一位
hull = []; % 用于存储凸包上的点的内存
hull = [hull, points(1,:)]; % p1入栈
hull(1,3) = 0;

% 将剩下的点按照与P1的极角重新排序
for i = 2:n
    points(i,3) = calcul_poleangle(points(1,:), points(i,:));
end
points = sortrows(points, 3); %这里排序的复杂度n*log(n)

% P2一定为凸包上的点，假设P3也是计算剩下所有点对于P2P3的转向，若有点转向右侧，则表示P3不是凸包上的点，P3出栈，由此压入所有单向转向的点为凸包的点
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