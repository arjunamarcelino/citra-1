function contrast_stretching(file)
    img = imread(file);
    
    [nrow, ncoll, ndepth] = size(img);
    
    hist = raw_histogram(file);
    
    smin = 0;
    smax = 255;

    for i=1:255
        if hist(2,i) > 0
            rmin = hist(1,i);
            break
        end
    end
    
    for i=255:-1:1
        if hist(2,i) > 0
            rmax = hist(1,i);
            break
        end
    end

    disp(rmax);
    disp(rmin);
    temp = [1:256];
    
    for i=1:255
        pix = y(i,rmin,rmax,smin,smax);
    
        if pix > 255
            pix = 255;
        elseif pix < 0
            pix = 0;
        end
        
        temp(i) = pix;
    end
    
    for k=1:ndepth
        for i=1:nrow
            for j=1:ncoll
                img(i,j,k) = temp(img(i,j,k));
            end
        end
    end
    
    imwrite(img,"output.jpg");
end

function y = y(x,rmin,rmax,smin,smax)
    y = round(((x - rmin) * (smax - smin) / (rmax - rmin)));
end