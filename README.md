# 射擊遊戲 shooting game

## 如何開始玩

1. 下載github中所有檔案
2. 將下載的所有檔案放在同一個資料夾中
3. 打開shooting_game.m
4. 在MATLAB的Command Window中輸入
    > shooting_game()
5. 建議遊玩時將遊戲視窗最大化
6. 遊戲過程中請使用英文輸入法，否則可能無法發射子彈

## 遊戲畫面

![image](https://i.imgur.com/uV2UJZ0.jpg)

## 遊戲說明

### 勝利條件
1. 控制自己發射子彈擊殺敵人，敵人一碰到子彈即會死亡
2. 累積擊殺指定數量敵人後，遊戲勝利並結束遊戲
    * 需擊殺敵人數量會根據選擇難度不同而改變

### 失敗條件

1. 敵人會不斷向下前進，若讓敵人碰到紅線，敵人會死亡，自己將會損失1點生命
    * 敵人碰到紅線後死亡不計算在擊殺敵人數量中
2. 自己總共有3點生命，當生命歸零時，遊戲失敗並結束遊戲

## 遊戲流程
1. 跳出選擇難度畫面
    

    |   按鍵   |    功能    |
    |:--------:|:----------:|
    | 滑鼠左鍵 |  選擇難度  |
    |   ESC    |  結束遊戲  |
    |   其他   | 不會有反應 |

    * 不同難度影響內容如下
       
    |           | 產生敵人間隔時間 (s) | 敵人移動速度 (每0.1秒移動的像素) | 需擊殺敵人數量 |
    |:---------:|:----------------------:|:----------------------------------:|:--------------:|
    |   Easy    |           2            |                 10                  |       15        |
    |  Normal   |          1.5           |                 15                  |       25       |
    | Difficult |           1            |                 20                 |       35       |
    
2. 開始進行遊戲，直到達成勝利條件或失敗條件或按下ESC
    * 達成勝利條件後會show出「You Win!」持續1.5秒，然後結束遊戲
    * 達成失敗條件後會show出「Game Over」持續1.5秒，然後結束遊戲
    * 按下ESC會直接結束遊戲


## 玩法


|     按鍵     |           功能            |
|:------------:|:-------------------------:|
|   方向鍵 ←   |      控制自己向左移動       |
|   方向鍵 →   |      控制自己向右移動       |
| 空白鍵 space | 發射子彈，發射子彈有1秒CD |
|     ESC      |       立即結束遊戲        |


## 已知問題
* ~~當遊戲進行一陣子後，會變得越來越LAG~~
    * ~~已和助教、教授討論過了，助教和教授都認為LAG沒關係~~
    * ~~有請助教幫忙看程式碼，找不到什麼可以優化的地方~~
    * 已解決，是因為hold on，所以畫的圖一直疊上去，造成記憶體占用過大

## Reference
1. [參考他的遊戲設計，程式內容完全無關](https://blog.csdn.net/slandarer/article/details/88025006?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control)
2. [自己、敵人、子彈的圖片素材](https://www.sogastudio.com/)
3. [解決圖片變白的問題](https://blog.csdn.net/hongshan50/article/details/6444914)
4. [偵測按鍵的方法](https://yuchungchuang.wordpress.com/2017/08/07/matlab-%E5%A4%9A%E9%87%8D%E6%8C%89%E9%8D%B5%E4%BA%8B%E4%BB%B6%E7%9A%84%E8%99%95%E7%90%86keypressfcn/)
5. [使視窗大小與圖片大小相同](http://mirlab.org/jang/books/matlabprogramming4beginner/19-2_imageDisplayAndPrint.asp?title=19-2%20%BCv%B9%B3%AA%BA%C5%E3%A5%DC%BBP%A6C%A6L)

