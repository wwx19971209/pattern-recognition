function [dis] =ddist(table,input1,cur)
%����Ҷ�ֱ��ͼ�����ƶ�
%table Ϊ����ҶȾ��� input1Ϊ���,curΪһά����
mdis=0;
for i=1:256
    mdis=mdis+(table(input1,i)-cur(i))^2;
end
dis=mdis;
end

