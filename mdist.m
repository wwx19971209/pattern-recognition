function [dis] = mdist(tab,tabp,input,p)
%������ɫ��ؾ������������ľ���
%inputΪ��ţ�tabΪԭʼ��ά����tabpΪ����λ����ά����pΪ�����
res=0;
for i=1:6
    for j=1:6
        res=(tab(input,i,j)-tabp(p,i,j))^2;
    end
end
dis=res;
end

