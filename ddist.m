function [dis] =ddist(table,input1,cur)
%计算灰度直方图的相似度
%table 为输入灰度矩阵 input1为编号,cur为一维矩阵
mdis=0;
for i=1:256
    mdis=mdis+(table(input1,i)-cur(i))^2;
end
dis=mdis;
end

