n = 4;
% points = round(rand(n, 2)*10);
points = [0 0; 1 3; 4 3; 2 2];
kf = [];
bf = [];
xf = [];
for i = 1:n-1
    for j = i+1:n
        if points(i, 1) - points(j, 1) ~= 0   
            k = (points(i, 2) - points(j, 2))/(points(i, 1) - points(j, 1));
            b = points(i, 2)-k*points(i, 1);
            res = zeros(1, n-2);
            p_index = 1:n;
            r_index = setdiff(p_index, [i j]);
            for index = 1:size(r_index, 2)
                res(index) = points(r_index(index), 1)*k + b - points(r_index(index), 2);
            end
            if abs(sum(sign(res(:)))) == n-2
                kf = [kf, k];
                bf = [bf, b];
            end
        else
            p_index = 1:n;
            r_index = setdiff(p_index, [i j]);
            res = zeros(1, n-2);
            for index = 1:size(r_index, 2)
                res(index) = points(r_index(index), 1) - points(i, 1);
            end
            if abs(sum(sign(res(:)))) == n-2
                xf = [xf, points(i, 1)];
            end
        end
    end
end
kf
bf
figure;
plot(points(:,1), points(:,2), 'bx')
hold on
for i = 1:size(kf,2)
    refline(kf(i),bf(i));
end
hold off
        