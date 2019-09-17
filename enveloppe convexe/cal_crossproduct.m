function res = cal_crossproduct(p1,p2,p3)
    res = (p2(1)-p1(1))*(p3(2)-p1(2)) - (p3(1)-p1(1))*(p2(2)-p1(2));