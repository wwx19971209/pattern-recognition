ndis=0;
point0=208;
point1=1;
point2=1;
for i=1:294
    if ndis<ddist(mdeep,i,mdeep(point0,:))
        point1=i;
        ndis=ddist(mdeep,i,mdeep(point0,:));
    end
end
ndis=0;
for i=1:294
    if ndis<min(ddist(mdeep,i,mdeep(point0,:)),ddist(mdeep,i,mdeep(point1,:)))
        point2=i;
        ndis=min(ddist(mdeep,i,mdeep(point0,:)),ddist(mdeep,i,mdeep(point1,:)));
    end
end
clear i ndis;