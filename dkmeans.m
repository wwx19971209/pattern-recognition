    %�Ҷ�ͼ��kmeans
    %��ʼ����
    cur1=mdeep(point0,:);
    cur2=mdeep(point1,:);
    cur3=mdeep(point2,:);

    %������������
    newp1=0;
    newp2=0;
    newp3=0;

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
        %���¼�������
        for i=1:294
            if div(i)==1
                newp1=newp1+mdeep(i,:)./num1;
            elseif div(i)==2
                newp2=newp2+mdeep(i,:)./num2;
            else
                newp3=newp3+mdeep(i,:)./num3;
            end
        end

        %�ж������Ƿ�ı�
        cur1=abs(cur1-newp1);
        cur2=abs(cur2-newp2);
        cur3=abs(cur3-newp3);
        if (sum(cur1)==0) && (sum(cur2)==0) && (sum(cur3)==0)
            check=0;
        end
        u=u+1;
        %�ı�����
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