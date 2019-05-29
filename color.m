%计算各个图片6*6的颜色相关矩阵并保存到对应文件夹，批量预处理
%源地址
duckadd=char('dataset/060.duck/060_00');
ducknum=87;
jetadd=char('dataset/069.fighter-jet/069_00');
jetnum=99;
irisadd=char('dataset/118.iris/118_0');
irisnum=108;
%目的地址
aimduckadd=char('dataset/duck.color/');
aimjetadd=char('dataset/jet.color/');
aimirisadd=char('dataset/iris.color/');

%duck piicture
for i=1:ducknum
    part=num2str(i);
    if i<10
        fadd=[duckadd '0' part '.jpg'];
    else
        fadd=[duckadd part '.jpg'];
    end
    pic=imread(fadd);
    if ndims(pic)~=3
        mysize=size(pic);
        for p=1:mysize(1)
            for q=1:mysize(2)
                pic(p,q,2)=pic(p,q,1);
                pic(p,q,3)=pic(p,q,1);
            end
        end
    end
    res=findcolor(pic,10);
    oadd=[aimduckadd part '.mat'];
    save(oadd,'res');
end

%jet pictrue
for i=1:jetnum
    part=num2str(i);
    if i<10
        fadd=[jetadd '0' part '.jpg'];
    else
        fadd=[jetadd part '.jpg'];
    end
    pic=imread(fadd);
    if ndims(pic)~=3
        mysize=size(pic);
        for p=1:mysize(1)
            for q=1:mysize(2)
                pic(p,q,2)=pic(p,q,1);
                pic(p,q,3)=pic(p,q,1);
            end
        end
    end
    res=findcolor(pic,10);
    oadd=[aimjetadd part '.mat'];
    save(oadd,'res');
end

%iris picture
for i=1:irisnum
    part=num2str(i);
    if i<10
        fadd=[irisadd '00' part '.jpg'];
    elseif i<100
        fadd=[irisadd '0' part '.jpg'];
    else
        fadd=[irisadd part '.jpg'];
    end
    pic=imread(fadd);
    if ndims(pic)~=3
        mysize=size(pic);
        for p=1:mysize(1)
            for q=1:mysize(2)
                pic(p,q,2)=pic(p,q,1);
                pic(p,q,3)=pic(p,q,1);
            end
        end
    end
    res=findcolor(pic,10);
    oadd=[aimirisadd part '.mat'];
    save(oadd,'res');
end
clear all;