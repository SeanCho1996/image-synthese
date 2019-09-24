function [r x y] = smallest_circle(P)
[r, x, y] = circle_2p(P(1, :), P(2, :));
for i = 3:size(P, 1)
    if norm(P(i, :) - [x, y]) > r
        [r, x, y] = smallest_circle_passing_1p_withcloud(P(1:(i-1), :), P(i, :));
    end
end