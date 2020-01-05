%用于设定定时器进行采样
s = mySerial;
s = s.init();
t=timer('TimerFcn','s = s.read();','Period',0.001,'ExecutionMode','fixedSpacing','TasksToExecute',1000);
start(t)
