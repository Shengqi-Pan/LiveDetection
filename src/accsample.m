%�����趨��ʱ�����в���
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
    [y, fs] = audioread('..\data\��Ȩ��.mp3');
    sound(y,fs);           % �ط������ź�
else
    play(R);
end

plot(s.acc_signal);

figure();
y = getaudiodata(R);
plot(y)
