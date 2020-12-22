function shooting_game()
% It will become very lag after playing for a while

    global ourself_pic
    global ourself_pos
    global ourself_size
    global ourself_speed    
    global ourself_life
    
    global enemy_pic    
    global enemy_pos
    global enemy_size
    global enemy_speed
    global enemy_generate_time
    global enemy_limit_move_range
    global enemy_to_delete_index
    
    global bullet_pic    
    global bullet_pos
    global bullet_size
    global bullet_speed
    global bullet_to_delete_index
    
    global our_grade
    global win_grade
    
    global quit
    
    global generate_enemy_timer
    global generate_bullet_timer
    
    ourself_pic=imread("ourself.png");    
    ourself_pos=[1130,345];
    ourself_size=[128,78];
    ourself_speed=30;
    ourself_life=3;
    
    enemy_pic=imread("mid_enemy.png");    
    enemy_pos=[];
    enemy_size=[128,98];
    enemy_speed=6;
    enemy_limit_move_range=980;
    
    bullet_pic=imread("bullet.png");  
    bullet_pos=[];
    bullet_size=[50,50];
    bullet_speed=13;
    
    our_grade=0;

    quit=0;
    
    generate_enemy_timer=2;
    generate_bullet_timer=5;
    
    hold on;
    choose_difficulty();
    
    tic;
    previous_toc=toc;
    while(true)        
        hold on;
        
        % timer
        current_toc=toc;
        if(current_toc-previous_toc>=0.01)
            
            move_enemy();
            move_bullet();
            generate_enemy_timer=generate_enemy_timer+toc-previous_toc;
            generate_bullet_timer=generate_bullet_timer+toc-previous_toc;
            generate_enemy();
            
            previous_toc=toc;
        end
        
        % move, fire, escape
        set(gcf,'KeyPressFcn',@kpfun);
        
        % close game
        if(quit==1) 
            return;
        end

        % update picture
        image_current_picture();
        
    end
     
    function choose_difficulty() % can consider to use object to implement
        Difficulty=imread("difficulty.png");
        imshow(Difficulty);
        axis image;
        
        % ginput until the user press left button in the difficulty range or press esc to close the game
        while(true)
            button=0;
            
            while(button~=1) 
                [X,Y,button]=ginput(1);
                if(button==27)
                    break;
                end
            end

            if(button==27) 
                Quit_game();
            end 

            % difference of different difficulty are enemy_generate_time and win_grade
            if(X>=254&&X<=530&&Y>=337&&Y<=441) % easy
                enemy_generate_time=4;
                enemy_speed=6;
                win_grade=6;
                break;
            elseif(X>=254&&X<=530&&Y>=650&&Y<=755) % normal
                enemy_generate_time=3.5;
                enemy_speed=7;
                win_grade=12;
                break;
            elseif(X>=254&&X<=530&&Y>=068&&Y<=1064) % difficult
                enemy_generate_time=3;
                enemy_speed=10;
                win_grade=18;
                break;
            end
        end
    end

    function image_current_picture()
        current_picture=zeros(1280,780,3);
        current_picture(floor(enemy_limit_move_range+130):floor(enemy_limit_move_range+130+10),1:780,1)=ones(11,780)*255; % the red line which means enemy_limit_move_range
        
        % plot ourself
        current_picture(floor(ourself_pos(1)):floor(ourself_pos(1)+ourself_size(1)-1),floor(ourself_pos(2)):floor(ourself_pos(2)+ourself_size(2)-1),:)=ourself_pic;
        
        % plot enemy
        if(size(enemy_pos,2)>0)
            for ii=1:2:size(enemy_pos,2)
                current_picture(floor(enemy_pos(ii)):floor(enemy_pos(ii)+enemy_size(1)-1),floor(enemy_pos(ii+1)):floor(enemy_pos(ii+1)+enemy_size(2)-1),:)=enemy_pic;
            end
        end
        
        % plot bullet
        if(size(bullet_pos,2)>0)
            for ii=1:2:size(bullet_pos,2)
                current_picture(bullet_pos(ii):bullet_pos(ii)+bullet_size(1)-1,bullet_pos(ii+1):bullet_pos(ii+1)+bullet_size(2)-1,:)=bullet_pic;
            end
        end
        
        imshow(current_picture/255) % /255 is beacuse the picture will become white if we don't /255
        drawnow;
        axis image;
    end

    function Quit_game()
        ThankYou=imread("ThankYou.png");
        imshow(ThankYou);
        quit=1;
    end

    function kpfun(~,event)
        switch event.Key
            case 'leftarrow'
                move_ourself("left");
            case 'rightarrow'
                move_ourself("right");
            case 'space'
                fire_bullet();                
            case 'escape'
                Quit_game();
        end
    end
    function move_ourself(direction)
        temp_ourself_pos=ourself_pos;
        if(direction=="left")
            temp_ourself_pos(2)=temp_ourself_pos(2)-ourself_speed;
        else
            temp_ourself_pos(2)=temp_ourself_pos(2)+ourself_speed;
        end
        
        % if the move this time will make ourself out of the picture of game, stay original position
        if(temp_ourself_pos(2)>=1&&temp_ourself_pos(2)<=780-ourself_size(2))
            ourself_pos=temp_ourself_pos;
        end
    end
    function fire_bullet() 
        if(generate_bullet_timer>=1)
            bullet_pos=[bullet_pos,ourself_pos(1)-75,ourself_pos(2)+13];  % -75,+13 make the bullet fire from the middle of us
            generate_bullet_timer=0;
        end
    end

    function generate_enemy()
        if(generate_enemy_timer>=enemy_generate_time)
            enemy_pos=[enemy_pos,1,rand(1)*650+1];  % range=[1,651]
            generate_enemy_timer=0;
        end
    end

    function move_enemy()        
        for ii=1:2:size(enemy_pos,2)
            enemy_pos(ii)=enemy_pos(ii)+enemy_speed;
            if(enemy_pos(ii)>=enemy_limit_move_range)
                enemy_to_delete_index=[enemy_to_delete_index,ii];
                ourself_life=ourself_life-1;
            end
        end
        
        if(size(enemy_to_delete_index,2)~=0)
        	delete_enemy();
        end
    end
    function delete_enemy()
        temp_enemy_pos=[];  % new enemy_pos
        delete_index=1;
        
        for ii=1:2:size(enemy_pos,2)
            if(delete_index<=size(enemy_to_delete_index,2)&&ii==enemy_to_delete_index(delete_index))
                delete_index=delete_index+1;
            else
                temp_enemy_pos=[temp_enemy_pos,enemy_pos(ii),enemy_pos(ii+1)];
            end
        end
        enemy_pos=temp_enemy_pos;
        enemy_to_delete_index=[];
        
        if(ourself_life<=0)
            GameOver();
        end
    end
    function GameOver() 
        GameOver=imread("GameOver.png");
        imshow(GameOver);
        pause(1.5);
        Quit_game();
    end

    function move_bullet() 
        for ii=1:2:size(bullet_pos,2)
            bullet_pos(ii)=bullet_pos(ii)-bullet_speed;
            if(bullet_pos(ii)<=50)
                bullet_to_delete_index=[bullet_to_delete_index,ii];
            else
                for jj=1:2:size(enemy_pos,2)
                    % if bullet and enemy collide
                    if((bullet_pos(ii)>=enemy_pos(jj)&&bullet_pos(ii)<=enemy_pos(jj)+enemy_size(1)||bullet_pos(ii)+bullet_size(1)>=enemy_pos(jj)&&bullet_pos(ii)+bullet_size(1)<=enemy_pos(jj)+enemy_size(1))&&(bullet_pos(ii+1)>=enemy_pos(jj+1)&&bullet_pos(ii+1)<=enemy_pos(jj+1)+enemy_size(2)||bullet_pos(ii+1)+bullet_size(2)>=enemy_pos(jj+1)&&bullet_pos(ii+1)+bullet_size(2)<=enemy_pos(jj+1)+enemy_size(2)))
                        our_grade=our_grade+1;
                        bullet_to_delete_index=[bullet_to_delete_index,ii];
                        enemy_to_delete_index=[enemy_to_delete_index,jj];
                        break;
                    end
                end
            end
            
        end
        
        if(size(enemy_to_delete_index,2)~=0)
                    delete_enemy();
        end

        if(size(bullet_to_delete_index,2)~=0)
            delete_bullet();
        end
    end
    function delete_bullet()
        temp_bullet_pos=[]; % new bullet_pos
        delete_index=1;
        
        for ii=1:2:size(bullet_pos,2)
            if(delete_index<=size(bullet_to_delete_index,2)&&ii==bullet_to_delete_index(delete_index))
                delete_index=delete_index+1;
            else
                temp_bullet_pos=[temp_bullet_pos,bullet_pos(ii),bullet_pos(ii+1)];
            end
        end
        bullet_pos=temp_bullet_pos;
        bullet_to_delete_index=[];
        
        if(our_grade>=win_grade)
            YouWin();
        end
    end
    function YouWin() 
        YouWin=imread("YouWin.png");
        imshow(YouWin);
        pause(1.5);
        Quit_game();
    end

end
