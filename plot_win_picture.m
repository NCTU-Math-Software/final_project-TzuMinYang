function plot_win_picture(name_win_photo)
    % 本程式可將勝利畫面畫出，建議遊戲畫面的大小與勝利畫面的大小相同
    % input: name_win_photo,勝利畫面的圖片的名字(須包含附檔名)
    % output: (畫出勝利畫面)
    %
    % example:
    % input: name_win_photo = "win_photo.jpg";
    % input: plot_win_picture(name_win_photo);
    % output: (畫出勝利畫面)
    
    win_photo = imread(name_win_photo);
    image(win_photo);
end