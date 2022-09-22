function output = histogram_specification(file1, file2);
    % perataan histogram untuk kedua img
    img1 = histogram_equalization(file1);
    img2 = histogram_equalization(file2);
    
    pix = -1;
    map_pix = -1;
    
    for i=1:256
        if img1(2,i) ~= pix
            pix = img1(2,i);
            index = 1;
            closest_gap = 99999;
    
            for j=1:256

                gap = abs(pix - img2(2,j));
                if gap <= closest_gap
                    closest_gap = gap;
                elseif gap > closest_gap
                    break
                end
    
                index = index + 1;
            end
            
            if index > 256
                index = 256;
            end
    
            map_pix = img2(2, index);
        end
        
        img1(2,i) = map_pix;
    end

    output = img1;
end