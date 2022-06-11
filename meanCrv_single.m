clear
close all
fid1=fopen('coordinate_multi/vertex_conserved12_15ms.txt');
%fid1=fopen('dtdk2/kh300ks32/vertex_3kh300ks32t77.txt');
%fid1=fopen('v_kh300ks20t01b.txt');
a=textscan(fid1,'%f %f %f');
fid2=fopen('connect/connect_3khks.txt');
%fid2=fopen('c_3kh300ks20_rm.txt');
b=textscan(fid2,'%d %d %d');
a1=a{1};
a2=a{2};
a3=a{3};
FV.faces=[b{1} b{2} b{3}];
FV.vertices=[a1 a2 a3];
getderivatives=0;
[PrincipalCurvatures,PrincipalDir1,PrincipalDir2,FaceCMatrix,VertexCMatrix,Cmagnitude]= GetCurvatures( FV ,getderivatives);
meanCurvature=(PrincipalCurvatures(1,:)+PrincipalCurvatures(2,:))/2;
mesh_h=patch(FV,'FaceVertexCdata',meanCurvature','facecolor','interp','edgecolor','interp','EdgeAlpha',0.2);
set(mesh_h,'ambientstrength',0.35);
axis off
view([-45,35.2]);
camlight();
lighting phong
colorbar();
[F,x]=max(meanCurvature);
% [U,v]=max(a3);
% PFV=a3(33);
%F=meanCurvature(227);