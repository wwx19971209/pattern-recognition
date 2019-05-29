%kmeans实现算法
%对于不同的特征向量要调用不同的dist距离函数

k=3;%分三类
cur(1,:,:)=colifo(point0,:,:);%当前的聚类中心坐标
cur(2,:,:)=colifo(point1,:,:);
cur(3,:,:)=colifo(point2,:,:);
newp=zeros(3,6,6);%保存聚类后的重心
div=zeros(1,294);%div保存聚类结果，表示分在了哪一类里面
check=1;%记录是否停止循环
num1=0;
num2=0;
num3=0;%记录各类的点数
u=0;
%k-means实现部分
while check==1
    %按照距离分类
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
    %重新计算重心
    for i=1:294
        if div(i)==1
            newp(1,:,:)=newp(1,:,:)+colifo(i,:,:)./num1;
        elseif div(i)==2
            newp(2,:,:)=newp(2,:,:)+colifo(i,:,:)./num2;
        else
            newp(3,:,:)=newp(3,:,:)+colifo(i,:,:)./num3;
        end
    end
    
    %判断重心是否改变
    cur=cur-newp;
    if all(all(all(cur)))==0
        check=0;
    end
    u=u+1;
    %改变重心
    cur=newp;
    newp=zeros(3,6,6);
    num1=0;
    num2=0;
    num3=0;  
end