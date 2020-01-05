%�����趨��ʱ�����в���
% s = mySerial;
% s = s.init('com5');
t=timer('TimerFcn','s = s.read();','Period',0.001,'ExecutionMode','fixedSpacing','TasksToExecute',1000);
start(t)