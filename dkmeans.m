    %灰度图的kmeans
    %初始重心
    cur1=mdeep(point0,:);
    cur2=mdeep(point1,:);
    cur3=mdeep(point2,:);

    %计算后的新重心
    newp1=0;
    newp2=0;
    newp3=0;

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
            d1=ddist(mdeep,i,cur1);
            d2=ddist(mdeep,i,cur2);
            d3=ddist(mdeep,i,cur3);
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
                newp1=newp1+mdeep(i,:)./num1;
            elseif div(i)==2
                newp2=newp2+mdeep(i,:)./num2;
            else
                newp3=newp3+mdeep(i,:)./num3;
            end
        end

        %判断重心是否改变
        cur1=abs(cur1-newp1);
        cur2=abs(cur2-newp2);
        cur3=abs(cur3-newp3);
        if (sum(cur1)==0) && (sum(cur2)==0) && (sum(cur3)==0)
            check=0;
        end
        u=u+1;
        %改变重心
        cur1=newp1;
        cur2=newp2;
        cur3=newp3;
        newp1=zeros(1,256);
        newp2=zeros(1,256);
        newp3=zeros(1,256);
        num1=0;
        num2=0;
        num3=0;  
    end

    clear num1 num2 num3 newp1 newp2 newp3 check d1 d2 d3;