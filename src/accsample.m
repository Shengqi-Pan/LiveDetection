%用于设定定时器进行采样
R = audiorecorder(8000, 16 ,1);
record(R);
% s = mySerial;
% s = s.init('com4');
% t=timer('TimerFcn','s = s.read();','Period',0.001,'ExecutionMode','fixedSpacing','TasksToExecute',5000);
% start(t)
% fread(s.s, s.s.BytesAvailable);
flushinput(s.s)
for i = 1 : 5000
    s = s.read();
    pause(0.0009)
end
stop(R)
plot(s.acc_signal);
disp('a')
