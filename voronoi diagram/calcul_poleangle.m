function p_ang = calcul_poleangle(p1,p2)
angle = atand((p2(2)-p1(2))/(p2(1)-p1(1)));
if angle < 0
    p_ang = 180 - abs(angle);
else
    p_ang = angle;
end