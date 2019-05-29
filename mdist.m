function [dis] = mdist(tab,tabp,input,p)
%计算颜色相关矩阵特征向量的距离
%input为编号，tab为原始三维矩阵，tabp为质心位置三维矩阵，p为类别编号
res=0;
for i=1:6
    for j=1:6
        res=(tab(input,i,j)-tabp(p,i,j))^2;
    end
end
dis=res;
end

