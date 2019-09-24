function [r x y] = smallest_circle_passing_2p_withcloud(P,p1,p2)

[r, x, y] = circle_2p(p1, p2);
% rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1,'EdgeColor', 'g'),axis equal
for i = 1:size(P,1)
    if norm(P(i,:) - [x, y]) > r
        [r, x, y] = smallest_circle_passing_3p(P(i,:), p1, p2);
    end
    % rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'linewidth',1,'EdgeColor', 'g'),axis equal
end