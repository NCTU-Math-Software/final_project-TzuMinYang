function plane
planeown=imread('plane4.jpg');
plane_op=imread('plane1.jpg');
background=uint8(zeros(540,370,3));
change=uint8(zeros(50,50,3));
image=background;image(461:560,151:220,:)=planeown;
x=[510,185];bullet=[1000,200];direction=[0,-50];redline=[1,461;370,461];
set(gcf,'WindowButtonMotionFcn',@move)
set(gcf,'WindowButtonDownFcn',@kickfcn)
set(gcf,'tag','co','CloseRequestFcn',@clo)
set(gcf, 'KeyPressFcn', @key)
    function key(~,event)
        switch event.Key
            case 'uparrow'
                if level~=4
                    level=level+1;
                end
            case 'downarrow'
                if level~=1
                    level=level-1;
                end
        end
    end

    function clo(~,~)
        control=0;
        delete(findobj('tag','co'))
        clf
        close
    end
    
    function movebullet(~,~)
        planeop=[25,randi(345)+25];
        while control==1
            image(planeop(1)-25+1:planeop(1)+25,planeop(2)-25+1:planeop(2)+25,:)=plane_op;
            bullet(bullet(:,2)<50,:)=[];
            len=length(sum(bullet,2));
            bullet=bullet+[0,0;ones(len-1,1)*direction];
            show()
            image(planeop(1)-25+1:planeop(1)+25,planeop(2)-25+1:planeop(2)+25,:)=change;
            planeop=planeop+[10,0];part1=bullet(:,2); part2=bullet(:,1);
            a=find((part1<planeop(1)+25)&(part1>planeop(1)-25));
            b=find((part2<planeop(2)+25)&(part2>planeop(2)-25));
            c=intersect(a,b);
            if ~isempty(c)
                planeop=[25,randi(345)+25];
                bullet(c,:)=[];
            end
            pause(0.05)            
            if planeop(1)>435
                control=0;
                buttonName1=questdlg('You lose. What do you mean to do?','You lose','close','restart','close');
                if isempty(buttonName1)
                    buttonName1='end';
                end
                if strcmp(buttonName1,'restart')
                       clf; plane();
                else if strcmp(buttonName1,'close')
                            close all;
                    end
                end
           end
        end
    end
  function show(~,~)
        imshow(image)
        hold on
        scatter(gca,bullet(:,1),bullet(:,2),30,[0.75,0.75,0.75],'s','filled')
        scatter(gca,bullet(:,1),bullet(:,2)-5,12,[0.75,0.75,0.75],'^','filled')
        plot(redline(:,1),redline(:,2),'color',[0.3,0,0],'Linewidth',1.5)
    end
    function move(~,~)
        xy=get(gca,'CurrentPoint');
        x=xy(1);
        x=round(x);
        if x<335&&x>35
            image=background;
            image(461:560,x-35+1:x+35,:)=planeown;
        end 
    end
    function kickfcn(~,~)
        if strcmp(get(gcf,'SelectionType'),'alt')
            if control==1
                control=-1;
            end
            control=control+1;
            if control==1
                movebullet()
            end
        end
        if level==1
            bullet=[bullet;x,500];
        end
        if level==2
            bullet=[bullet;x-25,550;x+25,550];
        end
        if level==3
            bullet=[bullet;x-25,550;x+25,550;x,500;x-10,520;x+10,520];
        end
        if level==4
            bullet=[bullet;x-25,550;x+25,550;x,500;x-10,515;x+10,515;x-20,530;x+20,530];
        end
    end
level=1;
control=1;
movebullet()
end