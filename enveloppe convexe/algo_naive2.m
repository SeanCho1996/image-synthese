% intialize randomly 5 points
n = 8;
points = round(rand(n, 2)*10);
% points = [0 0; 1 3; 4 3; 2 2];

% draw points
figure
plot(points(:,1), points(:,2), 'bx')
hold on

% 每次取两个点，做一条直线，判断其他点是否在这条线同侧
p_index = 1:n;
for i = 1:n-1
    for j = i+1:n
        res = zeros(1, n-2);
            r_index = setdiff(p_index, [i j]); %取直线上两点以外的所有点
            for index = 1:size(r_index, 2)
                mat_temp = [1, points(i, 1), points(i, 2);
                            1, points(j, 1), points(j, 2);
                            1, points(r_index(index), 1), points(r_index(index), 2)];
                res(index) = det(mat_temp); %计算oriente
            end
            if abs(sum(sign(res(:)))) == n-2 %如果res中所有元素符号相同，则表示同侧
                plot([points(i, 1),points(j, 1)], [points(i, 2), points(j, 2)],'r'); %绘制直线
            end
    end
end