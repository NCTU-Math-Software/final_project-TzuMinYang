function play_sound(name_sound)
    % 本程式將音檔播放
    % input: name_sound,要播放的音檔的名字(須包含附檔名)
    % output: (播放音檔)
    %
    % example:
    % input: name_sound = "enemy_die_sound.wav";
    % input: play_sound(name_sound)
    % output: (播放音檔)

    [y, Fs] = audioread(name_sound);
    sound(y,Fs);
end