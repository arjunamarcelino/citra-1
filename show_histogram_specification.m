function show_histogram_specification(file1, file2)

    img = imread(file1);
    [nrow, ncoll, ndepth] = size(img);

    hist = histogram_specification(file1, file2);

    for k=1:ndepth
        for i=1:nrow
            for j=1:ncoll
                img(i, j, k) = hist(2, img(i, j, k) + 1);
            end
        end
    end

    imwrite(img,"output.bmp");
end