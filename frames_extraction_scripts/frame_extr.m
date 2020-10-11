function [ V ] = frame_extr(video_file_name,start_at_sec,n_frames_to_extract,fps,interval,path)

vidobj=VideoReader(video_file_name); 
frames=vidobj.Numberofframes; 
sprintf('The video contains %d frames',frames)
counter=0; 
for f=start_at_sec*fps:(start_at_sec+n_frames_to_extract*interval)*fps
b = mod(f,fps*interval); 
if(b==0) 
thisframe=read(vidobj,f); 
thisfile=sprintf('%s%s.jpg',path, secs2hms(counter+start_at_sec))
counter=counter+interval; 
imwrite(thisframe,thisfile); 
end 
end 
V=0;
end

