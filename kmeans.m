%kmeansʵ���㷨
%���ڲ�ͬ����������Ҫ���ò�ͬ��dist���뺯��

k=3;%������
cur(1,:,:)=colifo(point0,:,:);%��ǰ�ľ�����������
cur(2,:,:)=colifo(point1,:,:);
cur(3,:,:)=colifo(point2,:,:);
newp=zeros(3,6,6);%�������������
div=zeros(1,294);%div�������������ʾ��������һ������
check=1;%��¼�Ƿ�ֹͣѭ��
num1=0;
num2=0;
num3=0;%��¼����ĵ���
u=0;
%k-meansʵ�ֲ���
while check==1
    %���վ������
    for i=1:294
        d1=mdist(colifo,cur,i,1);
        d2=mdist(colifo,cur,i,2);
        d3=mdist(colifo,cur,i,3);
        if d1<=d2
            if d1<=d3
                div(i)=1;
                num1=num1+1;
            else
                div(i)=3;
                num3=num3+1;
            end
        else
            if d2<=d3
                div(i)=2;
                num2=num2+1;
            else
                div(i)=3;
                num3=num3+1;
            end
        end
    end
    %���¼�������
    for i=1:294
        if div(i)==1
            newp(1,:,:)=newp(1,:,:)+colifo(i,:,:)./num1;
        elseif div(i)==2
            newp(2,:,:)=newp(2,:,:)+colifo(i,:,:)./num2;
        else
            newp(3,:,:)=newp(3,:,:)+colifo(i,:,:)./num3;
        end
    end
    
    %�ж������Ƿ�ı�
    cur=cur-newp;
    if all(all(all(cur)))==0
        check=0;
    end
    u=u+1;
    %�ı�����
    cur=newp;
    newp=zeros(3,6,6);
    num1=0;
    num2=0;
    num3=0;  
end