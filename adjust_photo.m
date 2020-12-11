function photo_after_adjust = adjust_photo (photo_to_adjust,num_row)
    % 本程式可將圖片調整，並回傳調整後的圖片，只需指定調整後要有幾列即可，不須指定行數，他會自己計算
    % input: photo_to_adjust,要調整的圖片
    % input: num_row,要調整成大小有幾列的圖片
    % output: photo_after_adjust,調整後的圖片
    %
    % example:
    % input: enemy_photo = imread("enemy_photo.jpg");
    % input: photo_to_adjust = enemy_photo;
    % input: num_row = 80;
    % input: photo = adjust_photo (photo_to_adjust,num_row);
    % output: (photo = 調整後的圖片)

    photo_after_adjust = imresize(photo_to_adjust, [num_row NaN]);
end