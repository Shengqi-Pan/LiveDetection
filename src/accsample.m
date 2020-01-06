%用于设定定时器进行采样
R = audiorecorder(8000, 16 ,1);
record(R);
s = mySerial;
s = s.init('com7');
% t=timer('TimerFcn','s = s.read();','Period',0.001,'ExecutionMode','fixedSpacing','TasksToExecute',5000);
% start(t)
% fread(s.s, s.s.BytesAvailable);
% flushinput(s.s)
for i = 1 : 5000
    s = s.read();
    pause(0.0008)
end
stop(R)

if var(s.acc_signal) < 20
    [y, fs] = audioread('..\data\无权限.mp3');
    sound(y,fs);           % 回放语音信号
else
    play(R);
end

plot(s.acc_signal);

figure();
y = getaudiodata(R);
plot(y)
