function histogram = raw_histogram(file)
    img = imread(file);
    
    value_counter = zeros(1,256);
    value = [0:255];
    hist = [value; value_counter];
    
    [nrow, ncoll, ndepth] = size(img);
    
    for k=1:ndepth
        for i=1:nrow
            for j=1:ncoll
                hist(2, img(i,j,k) + 1) = hist(2, img(i,j,k) + 1) + 1;
            end
        end
    end
    
    histogram = hist;
end