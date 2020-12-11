function photo_after_compress = compression_photo (photo_to_compress,num_row)
    % 本程式可將圖片壓縮，並回傳壓縮後的圖片，只需指定壓縮後要有幾列即可，不須指定行數，他會自己計算
    % input: photo_to_compress,要壓縮的圖片
    % input: num_row,要壓縮成大小有幾列的圖片
    % output: photo_after_compress,壓縮後的圖片
    %
    % example:
    % input: enemy_photo = imread("enemy_photo.jpg");
    % input: photo_to_compress = enemy_photo;
    % input: num_row = 160;
    % input: photo = compression_photo (photo_to_compress,num_row);
    % output: (photo = 壓縮後的圖片)

    photo_after_compress = imresize(photo_to_compress, [num_row NaN]);
end