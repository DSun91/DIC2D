# Digital Image Correlation
#### This Folder contains the matlab implementation of the Lucas-Kanade algorithm for digital image correlation, applied on a tensile test of a composite material speciment in order to determine its characteristics like Young's Modulus, ultimate tensile strenght and yield point.
#### The implementation foresees the radiometric compensation of the background intensity and allows to choose the transformation model between pure translation or affine.

## HOW TO USE

### Step-1 

#### If we have a video of the tensile test, extract the frames you want to use with the following function:

#### function [ V ] = frame_extr(video_file_name,start_at_sec,n_frames_to_extract,fps,interval,path)

#### which allows us to extract a number of frame equal to the value assigned to the parameter "n_frames_to_extract" from the video named "video_file_name", characterized by a number of frames per second equal to "fps", with start of extraction at second "start_at_sec" and save directory "path" at intervals of second euqual to "interval".

#### For exmaple for extracting 50 frames from the video 'prov.mp4' (25 fps) in the directory 'frames2sec', starting at second 35 of the registration, one frame every 2 secs call:

#### >> V  = frame_extr('prov.mp4',35,50,25,2,'frames2sec/')

#### Once we have the frames we are ready for the correlation step.

### Step-2
#### Run the script "run_script.m" after assigning values to the following parameters in the script:

#### path=''; % the name of the directory where the frame are

#### crop_x1=270;%x1 coordinate of the rectangular area where to correlate, for using full image x1=0

#### crop_y1=20;%y1 coordinate of the rectangular area where to correlate, for using full image y1=0

#### crop_x2=500;%x2 coordinate of the rectangular area where to correlate, for using full image x2= images width

#### crop_y2=570;%y2 coordinate of the rectangular area where to correlate, for using full image x2= images height

#### offset_sec=35;%starting frame 

#### num_frames=50;% numbers of frames



## Please Note:
#### due to the high volume of computation it is recommended to compile the code using ">> coder" and adding all the files containing the% # codegen
#### after the compilation is dome use the _mex function to carry computation


