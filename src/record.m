%½øÐÐÂ¼Òô
% clear;clc;close all;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% play(recObj);
% y = getaudiodata(recObj);
% plot(y);

% fc = 4000;
% fs = 8000;bits = 8;
% N = 2 * pi * 3.1 / (0.1 * pi);
% wc = 2 * pi * fc / fs;
% N = N + mod(N, 2);
% Window = hanning(N + 1);
% b = fir1(N, 0.48, 'high', Window);
% y_high = filter(b, 1, y);
% sound(y_high, fs, bits);

%%%%%%%%%%%%%%%%%%%%
 R = audiorecorder(8000, 16 ,1);
 record(R);
 disp('1');
 