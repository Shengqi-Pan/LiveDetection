%用于设定定时器进行采样
t=timer('TimerFcn','read_serial();','Period',0.001,'ExecutionMode','fixedSpacing','TasksToExecute',1000);
start(t)
