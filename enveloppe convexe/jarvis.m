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

% search for the point on the left pole as the start point
[min_val, index_left] = min(points(:,1));
p_left = points(index_left,:);

% find the second point
angles = [];
r_index = setdiff(p_index, index_left);
for i = 1:size(r_index,2)
    angle2 = atand((points(r_index(i),2)-p_left(2))/(points(r_index(i),1)-p_left(1)));
    angles = [angles, angle2];
end
[max_ang, index_max] = max(angles);
% plot([p_left(1), points(r_index(index_max),1)], [p_left(2), points(r_index(index_max),2)], 'y')

% re-order all points, set a new memory for the convexe points
new_points = [p_left(1,:); points(r_index(index_max),:)];
hull = new_points; % memory to store convexe points
r_index = setdiff(p_index, [index_left,r_index(index_max)]);
new_points = [new_points; points(r_index,:)];
ind_ancient = 1;
ind_current = 2;
max_angle = 0;
angles = [];
for i = 2:n
    for j = 1:n
        temp_angle = cal_angle(hull(ind_ancient,:),hull(ind_current,:),new_points(j,:));
        if temp_angle ~= 180 && temp_angle>max_angle 
            max_angle = temp_angle;
            i = j; % 注意这里改变了循环次数，否则复杂度应该为n^2
            hull(ind_current+1,:) = new_points(j,:);
        end
    end
    ind_ancient = size(hull,1)-1;
    ind_current = size(hull,1);
    if i == 1
        break;
    end
    max_angle = 0;
end
plot(hull(:,1), hull(:,2),'g-')


