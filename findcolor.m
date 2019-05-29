function [outcol] = findcolor(inpic,d)
%����������ͼƬ����ɫ���ͼ����
%inpic��ͼƬ���룬d�����ؾ���

%���մ�СRGB=1,RBG=2,BRG=3,BGR=4,GRB=5,GBR=6��������¼��res1��
picsize=size(inpic);  %picsize:����ͼƬ��С
res1=zeros(picsize(1),picsize(2));
for i=1:picsize(1)
    for j=1:picsize(2)
        if inpic(i,j,1)>=inpic(i,j,2)
            if inpic(i,j,2)>=inpic(i,j,3)
                res1(i,j)=1;
            elseif inpic(i,j,3)>=inpic(i,j,1)
                res1(i,j)=3;
            else
                res1(i,j)=2;
            end
        else
            if inpic(i,j,1)>=inpic(i,j,3)
                res1(i,j)=5;
            elseif inpic(i,j,3)>=inpic(i,j,2)
                res1(i,j)=4;
            else
                res1(i,j)=6;
            end
        end      
    end
end

%����36ά��ɫ��ؾ���
pointnum=0;%��¼ĳ������ֵ��Χ�ĵ���
res2=zeros(6,6);
for i=1:6
    for m=1:picsize(1)
        for n=1:picsize(2)
            if res1(m,n)==i
                if m-d>=1
                    p=n-d;
                    q=n+d;
                    if p<1
                        p=1;
                    end
                    if q>picsize(2)
                        q=picsize(2);
                    end
                    for j=p:q
                        res2(i,res1(m-d,j))=res2(i,res1(m-d,j))+1;
                        pointnum=pointnum+1;
                    end
                end
                if m+d<=picsize(1)
                    p=n-d;
                    q=n+d;
                    if p<1
                        p=1;
                    end
                    if q>picsize(2)
                        q=picsize(2);
                    end
                    for j=p:q
                        res2(i,res1(m+d,j))=res2(i,res1(m+d,j))+1;
                        pointnum=pointnum+1;
                    end
                end
                if n-d>=1
                    p=m-d+1;
                    q=m+d+1;
                    p=max(p,1);
                    q=min(q,picsize(1));
                    for j=p:q
                        res2(i,res1(j,n-d))=res2(i,res1(j,n-d))+1;
                        pointnum=pointnum+1;
                    end
                end
                if n+d<=picsize(2)
                    p=m-d+1;
                    q=m+d+1;
                    p=max(p,1);
                    q=min(q,picsize(1));
                    for j=p:q
                        res2(i,res1(j,n+d))=res2(i,res1(j,n+d))+1;
                        pointnum=pointnum+1;
                    end
                end
            end
        end
    end
    for j=1:6
        if pointnum==0
            res2(i,j)=0;
        else    
            res2(i,j)=res2(i,j)/pointnum;
        end
    end
    pointnum=0;  
end
outcol=res2;
end