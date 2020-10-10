clear all
clc
path='frames_video2sec/';
crop_x1=270;
crop_y1=20;
crop_x2=500;
crop_y2=570;

offset_sec=35;
num_frames=40;


Ut=zeros(crop_y2-crop_y1,crop_x2-crop_x1);
Vt=zeros(crop_y2-crop_y1,crop_x2-crop_x1);
 

for f=offset_sec:offset_sec+num_frames-1
foto1=load_imgf(f,path);
foto2=load_imgf(f+1,path);
%a=sprintf('s (%d).tif',f)
%b=sprintf('s (%d).tif',f+1)
%foto1=imread(a);
%foto2=imread(b);
[a, b]=set_immag(foto1,foto2,crop_x1,crop_y1,crop_x2,crop_y2);
[U,V] = Lucas_kanade_mex('Lucas_kanade', a,b,25,2,1,1);
Ut=Ut+U;
Vt=Vt+V;    
end

figure(1)
imagesc(Vt);
colorbar
figure(2);
imagesc(Ut);
colorbar


  
