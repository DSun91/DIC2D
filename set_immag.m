function [f1,f2] = set_immag(foto1, foto2,x1,y1,x2,y2)
%#codegen
%f1=zeros(size(foto1,1),size(foto1,2));
%f2=zeros(size(foto1,1),size(foto1,2));
f1=zeros(y2-y1,x2-x1);
f2=zeros(y2-y1,x2-x1);
J =  imcrop(rgb2gray(foto1),[x1,y1,x2,y2]);
K =  imcrop(rgb2gray(foto2),[x1,y1,x2,y2]);

for i=1:size(f1,1)
for j=1:size(f1,2)
f1(i,j)=J(i,j);
f2(i,j)=K(i,j);
end
end


end
%h1 = fspecial('gaussian',3,1);
% foto1 = imfilter(foto1,h1);