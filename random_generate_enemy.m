function random_generate_enemy(max_x,max_y,enemy_photo)
    % 本程式的xy以座標軸的xy為準
    % 本程式需搭配update_enemy.m使用，本程式可隨機產生敵人的位置，並將他畫出來
    % input: max_x,遊戲畫面的x範圍
    % input: max_y,遊戲畫面的y範圍
    % input: enemy_photo,敵人的圖片
    % output: (隨機生成敵人後的圖片)
    %
    % example:
    % input: max_x = 3000;
    % input: max_y = 2000;
    % input: enemy_photo = imread("enemy_photo.jpg");
    % input: random_generate_enemy(max_x,max_y,enemy_photo);
    % output: (隨機生成敵人後的圖片)
    
    % 因為圖片的xy和坐標軸的xy相反，所以photo_size_y,photo_size_x要相反
    [photo_size_y,photo_size_x,rgb] =size(enemy_photo);
    % 避免圖片畫超出遊戲畫面
    x = rand(1)*(max_x-photo_size_x);
    y = rand(1)*(max_y-photo_size_y);
    
    update_enemy(x,y,max_x,max_y,enemy_photo); 
end