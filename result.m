num11=0;
num12=0;
num13=0;
num21=0;
num22=0;
num23=0;
num31=0;
num32=0;
num33=0;
for i=1:87
    if div(i)==1
        num11=num11+1;
    elseif div(i)==2
        num12=num12+1;
    else
        num13=num13+1;
    end
end

for i=88:186
    if div(i)==1
        num21=num21+1;
    elseif div(i)==2
        num22=num22+1;
    else
        num23=num23+1;
    end
end

for i=187:294
    if div(i)==1
        num31=num31+1;
    elseif div(i)==2
        num32=num32+1;
    else
        num33=num33+1;
    end
end

right=max((num11+num22+num33)/294,max((num11+num23+num32)/294,max((num12+num21+num33)/294,max((num12+num23+num31)/294,max((num13+num21+num32)/294,(num13+num22+num31)/294)))));