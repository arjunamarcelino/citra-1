function out = histogram_equalization(file)
    img = imread(file);

    [nrow, ncoll, ndepth] = size(img);
    img_size = nrow * ncoll * ndepth;
        
    hist = raw_histogram(file);
    
    for i=1:256
       hist(2, i) = hist(2, i) / img_size; 
    end
    
    for i=2:256
       hist(2, i) = hist(2, i) + hist(2, i - 1);
    end
    
    for i=1:256
       hist(2, i) = hist(2, i) * 255;
       hist(2, i) = round(hist(2, i));
    end
    
    out = hist;
end