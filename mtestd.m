for i=1:1000
    point0=int8(294*rand(1));
    while point0==0
        point0=int8(294*rand(1));
    end
    point1=int8(294*rand(1));
    while point1==0 || point1==point0
        point1=int8(294*rand(1));
    end
    point2=int8(294*rand(1));
    while point2==0 || point2==point1 ||point2==point0
        point2=int8(294*rand(1));
    end
    dkmeans;
    result;
    mresult(i)=right;
end