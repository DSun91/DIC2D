function [ imgdata ] = load_imgf(f,path)

    counter_min=floor(f/60);
    if (counter_min==0)
    thisfile=sprintf('%s%.1f secs.jpg',path,f);
  else if (counter_min==1)
    thisfile=sprintf('%s%d min, %.1f secs.jpg',path,counter_min,f-(counter_min*60));
        else if (counter_min>1)
    thisfile=sprintf('%s%d mins, %.1f secs.jpg',path,counter_min,f-(counter_min*60));
            end
        end
    end
imgdata=imread(thisfile);
disp( thisfile );
disp('   ');
end

