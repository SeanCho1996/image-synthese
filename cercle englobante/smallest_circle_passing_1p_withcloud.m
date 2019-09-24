function [r x y] = smallest_circle_passing_1p_withcloud(P, q)
[r, x, y] = circle_2p(P(1, :), q);
for i = 2:size(P,1)
   if norm(P(i, :) - [x, y]) > r
       [r, x, y] = smallest_circle_passing_2p_withcloud(P(1:(i-1), :), P(i, :), q);
   end
end