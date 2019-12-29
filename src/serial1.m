%新建串口对象
s1=serial('COM5','BaudRate',115200,'parity','none','databits',8,'stopbits',1); 

%尝试代开串口
try
  fopen(s1);  %打开串口对象
catch err
  fclose(instrfind);  %关闭被占用的串口
  error('请确认选择了正确的串口');  %输出错误提示
end
while 1
%     a = fscanf(s1,'%d');  %读取数据
%     a = fread(s1);
    if ~isempty(a)
        break;
    end
end
fclose(s1);  %关闭串口
delete(s1);
clear s1;