


function update_enemy()
    x = rand(1)*1240;
    y = rand(1)*1859;
    plot_enemy(x,y);
end

function plot_enemy (x,y)
    enemy_photo = imread('enemy_photo.jpg');
    whole_photo = ones(1400,2100,3)*255;
    image(whole_photo);
    hold on;
    image(x,y,enemy_photo);
end