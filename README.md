# final_project-TzuMinYang

我想做Project 7-遊戲的5.射擊遊戲

我使用網路上查到的程式plan.m

來源是：https://blog.csdn.net/slandarer/article/details/88025006?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control



# 以下是舊的資料，先不用管

## 目前已完成的工具

將檔案與測試檔案一起下載才能正常使用程式中的example

### 播放音效

* 功能：播放指定音檔

* 檔案：play_sound.m

* 測試檔案：enemy_die_sound.wav

### 調整圖片大小

* 功能：調整圖片的大小，會依照原本的比例去縮放，所以只需指定調整後的行數即可，列數他會自己計算

* 檔案：adjust_photo.m

* 測試檔案：enemy_photo.jpg

### 畫出勝利圖片

* 功能：畫出勝利圖片，建議遊戲畫面的大小與勝利畫面的大小相同

* 檔案：plot_win_picture.m

* 測試檔案：win_photo.jpg

### 更新敵人位置

* 功能：本畫出更新敵人位置後的遊戲畫面 (本程式的xy以座標軸的xy為準)

* 檔案：update_enemy.m

* 測試檔案：無

### 隨機生成敵人

* 功能：可隨機產生敵人的位置，並將他畫出來 (本程式的xy以座標軸的xy為準)

* 檔案：random_generate_enemy.m , update_enemy.m (本程式需搭配update_enemy.m才能使用)

* 測試檔案：無
