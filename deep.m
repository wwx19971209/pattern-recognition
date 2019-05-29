%计算图片灰度直方图
%源地址
duckadd=char('dataset/060.duck/060_00');
ducknum=87;
jetadd=char('dataset/069.fighter-jet/069_00');
jetnum=99;
irisadd=char('dataset/118.iris/118_0');
irisnum=108;
count=1;
mdeep=zeros(294,256);
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
    pic=rgb2gray(pic);
    picsize=size(pic);
    for m=1:picsize(1)
        for n=1:picsize(2)
            mdeep(count,pic(m,n)+1)=mdeep(count,pic(m,n)+1)+1/(picsize(1)*picsize(2));
        end
    end
    count=count+1;
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
    pic=rgb2gray(pic);
    picsize=size(pic);
    for m=1:picsize(1)
        for n=1:picsize(2)
            mdeep(count,pic(m,n)+1)=mdeep(count,pic(m,n)+1)+1/(picsize(1)*picsize(2));
        end
    end
    count=count+1;
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
    pic=rgb2gray(pic);
    picsize=size(pic);
    for m=1:picsize(1)
        for n=1:picsize(2)
            mdeep(count,pic(m,n)+1)=mdeep(count,pic(m,n)+1)+1/(picsize(1)*picsize(2));
        end
    end
    count=count+1;
end
clear m n i duckadd ducknum jetadd jetnum irisadd irisnum pic picsize p q fadd part mysize count;