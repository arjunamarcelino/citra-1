function image_brightening(file, a, b)
    img = imread(file);

    [nrow, ncoll, ndepth] = size(img);

    for k = 1 : ndepth
        for i = 1: nrow
            for j = 1 : ncoll
                new_pix = img(i, j, k) * a + b;

                %trimnming
                if new_pix > 255
                    new_pix = 255;
                elseif new_pix < 0
                    new_pix = 0;
                end

                img(i, j, k) = new_pix;
            end
        end
    end

    imwrite(img, "output.jpg");
end
