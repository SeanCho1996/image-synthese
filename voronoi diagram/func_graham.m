function hull = func_graham(points)
n = size(points, 1);

index = 1;
% �ҵ����·��ĵ㣬��Ϊ͹���ϵĵ�
for i = 1:n
    if(points(i,2) < points(index,2) || (points(i,2) == points(index,2) && points(i,1) < points(index,1)))
        index = i;
    end
end
points([1 index],:) = points([index 1], :); %��������Ƶ���һλ
hull = []; % ���ڴ洢͹���ϵĵ���ڴ�
hull = [hull, points(1,:)]; % p1��ջ
hull(1,3) = 0;

% ��ʣ�µĵ㰴����P1�ļ�����������
for i = 2:n
    points(i,3) = calcul_poleangle(points(1,:), points(i,:));
end
points = sortrows(points, 3); %��������ĸ��Ӷ�n*log(n)

% P2һ��Ϊ͹���ϵĵ㣬����P3Ҳ�Ǽ���ʣ�����е����P2P3��ת�����е�ת���Ҳ࣬���ʾP3����͹���ϵĵ㣬P3��ջ���ɴ�ѹ�����е���ת��ĵ�Ϊ͹���ĵ�
hull = [hull; points(2,:); points(3,:)];
top = 3;
for i = 4:n
    while top>1 && (cal_crossproduct(hull(top-1,:),points(i,:),hull(top,:))>=0)
        hull(top,:) = [];
        top = top-1;
    end
    hull = [hull; points(i,:)];
    top = top+1;
end
hull = [hull; points(1,:)];