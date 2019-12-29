clear;clc;close all;
[y, fs] = audioread('..\data\test.mp3');
z = (y(:,1) + y(:,2))/2;
subplot(2,1,1);
plot(z);

z(find(z > -0.03 & y < 0.03)) = 0;
z(z==0) = [];
subplot(2,1,2);
plot(z);
sound(z,fs)           % »Ø·ÅÓïÒôÐÅºÅ