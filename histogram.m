function histogram(file)
    hist = raw_histogram(file);

    bar(hist(1,:), hist(2,:));
    set(gca, 'YScale', 'log');
end