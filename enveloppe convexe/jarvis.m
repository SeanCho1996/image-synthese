clc
clear

% intialize randomly 5 points
n = 5;
points = rand(n, 2)*10;
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
plot([p_left(1), points(r_index(index_max),1)], [p_left(2), points(r_index(index_max),2)], 'y')

new_points = [p_left(1,:); points(r_index(index_max),:)];
r_index = setdiff(p_index, [index_left,r_index(index_max)]);
new_points = [new_points; points(r_index,:)];
ind_ancient = 1;
ind_current = 2;
angles = [];
for i = 2:n
    for j = 1:n
        angle1 = atand((new_points(ind_current, 2)-new_points(ind_ancient,2))/(new_points(ind_current, 1)-new_points(ind_ancient,1)));
        angle2 = atand((new_points(j, 2)-new_points(ind_current,2))/(new_points(j, 1)-new_points(ind_current,1)));
        if angle1 < 0 && angle2 <0
            angle = 180+abs(angle1)-abs(angle2);
        elseif  angle1 < 0 && angle2 > 0
            angle = abs(angle1) + angle2;
        else
            angle = abs(angle1-angle2);
        end
        if angle==180
            angle = 0;
%         elseif angle > 180
%             angle = 360-angle;
        end
        angles = [angles, angle];
    end
    [max_ang, index_max] = max(angles);
    plot([new_points(ind_current, 1), new_points(index_max,1)], [new_points(ind_current, 2), new_points(index_max,2)], 'y');
    ind_ancient = ind_current;
    ind_current = index_max;   
    if ind_current == 1
        break;
    end
    angles = [];
end

