% intialize randomly 5 points
n = 5;
points = round(rand(n, 2)*10);
% points = [0 0; 1 3; 4 3; 2 2];

% draw points
figure
plot(points(:,1), points(:,2), 'bx')
hold on

% ÿ��ȡ�����㣬��һ��ֱ�ߣ��ж��������Ƿ���������ͬ��
p_index = 1:n;
for i = 1:n-1
    for j = i+1:n
        res = zeros(1, n-2);
            r_index = setdiff(p_index, [i j]); %ȡֱ����������������е�
            for index = 1:size(r_index, 2)
                mat_temp = [1, points(i, 1), points(i, 2);
                            1, points(j, 1), points(j, 2);
                            1, points(r_index(index), 1), points(r_index(index), 2)];
                res(index) = det(mat_temp); %����oriente
            end
            if abs(sum(sign(res(:)))) == n-2 %���res������Ԫ�ط�����ͬ�����ʾͬ��
                plot([points(i, 1),points(j, 1)], [points(i, 2), points(j, 2)],'r'); %����ֱ��
            end
    end
end