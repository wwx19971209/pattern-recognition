%����Ҫ����k-means�����ݶ����ڴ�

%������������Ŀ
ducknum=87;
jetnum=99;
irisnum=108;
%���Ե�ַ
aimduckadd=char('dataset/duck.color/');
aimjetadd=char('dataset/jet.color/');
aimirisadd=char('dataset/iris.color/');

%��ʼ��������Ϣ����ά����
wholenum=ducknum+jetnum+irisnum;
colifo=zeros(wholenum,6,6);

check=1;
for i=1:ducknum
    part=num2str(i);
    radd=[aimduckadd part '.mat'];
    load(radd);
    colifo(check,:,:)=res;
    check=check+1;
end

for i=1:jetnum
    part=num2str(i);
    radd=[aimjetadd part '.mat'];
    load(radd);
    colifo(check,:,:)=res;
    check=check+1;
end

for i=1:irisnum
    part=num2str(i);
    radd=[aimirisadd part '.mat'];
    load(radd);
    colifo(check,:,:)=res;
    check=check+1;
end
    
clear ducknum jetnum irisnum aimduckadd aimjetadd aimirisadd wholenum;
clear part radd res check i;