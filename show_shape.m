close all
i=0.5;
dx=10;
fid1=fopen('CurvatureEstimation/coordinate_multi/vertex_1c.txt');
%fid1=fopen('CurvatureEstimation/dtdk2/kh300ks20/vertex_3kh300ks20t11.txt');
a=textscan(fid1,'%f %f %f');
x=a{1};
y=a{2};
z=a{3};
[xq,yq] = meshgrid(-300:dx:300);
zq=griddata(x,y,z,xq,yq,'cubic');
%zq=griddata(x,y,z,xq,yq);
for m=1:round(600/dx+1)
    for n=1:round(600/dx+1)
        if zq(m,n)<0
            zq(m,n)=0;
        end
    end
end
mesh(xq,yq,zq,'EdgeAlpha',0.6)
pbaspect([1 1 0.1])
caxis([0 30])
view([-29.8 7.8])
zlim([0 60]);
zticks([0 60])
xlim([-300 300])
ylim([-300 300])
xlabel('\fontsize{20}{x(nm)}')
ylabel('\fontsize{20}{y(nm)}')
zlabel('\fontsize{20}{z(nm)}')
title('20ms')
