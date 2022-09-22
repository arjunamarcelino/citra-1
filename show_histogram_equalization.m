function show_histogram_equalization(file)

    img = imread(file);
    [nrow, ncoll, ndepth] = size(img);

    hist = histogram_equalization(file);

    for k=1:ndepth
        for i=1:nrow
            for j=1:ncoll
                img(i, j, k) = hist(2, img(i, j, k) + 1);
            end
        end
    end

    imwrite(img,"output.jpg");
end