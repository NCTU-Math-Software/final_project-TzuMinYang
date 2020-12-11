function update_enemy(x,y,max_x,max_y,enemy_photo)
    % 本程式的xy以座標軸的xy為準
    % 本程式可畫出更新敵人位置後的遊戲畫面
    % input: x,要把敵人畫在哪個x位置
    % input: y,要把敵人畫在哪個y位置
    % input: max_x,遊戲畫面的x範圍
    % input: max_y,遊戲畫面的y範圍
    % input: enemy_photo,敵人的圖片
    % output: (更新敵人位置後的遊戲畫面)
    %
    % example:
    % input: x = 500;
    % input: y = 0;
    % input: max_x = 3000;
    % input: max_y = 2000;
    % input: enemy_photo = imread("enemy_photo.jpg");
    % input: update_enemy(x,y,max_x,max_y,enemy_photo)
    % output: (更新敵人位置後的遊戲畫面)
    
    % 產生全白的圖片，畫出來之後再在指定位置畫出敵人
    whole_photo = ones(max_y,max_x,3)*255;
    image(whole_photo);
    hold on;
    image(x,y,enemy_photo);
    hold off;
end