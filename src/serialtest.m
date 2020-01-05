% 用于串口测试的单独文件，没啥用
s=serial('com7');
s.BytesAvailableFcnMode='byte';  % 串口设置
s.InputBufferSize=4096;
s.OutputBufferSize=1024;
s.BytesAvailableFcnCount=100;
set(s,'BaudRate',115200,'Parity','none','DataBits',8,'StopBits',1);  %波特率为115200bp，8位数据，无校验位
fopen(s);                  %打开串口
out=fread(s,2,'uint8');   %一次读出10个字符  
fprintf('%2c',out);        %一个字符占三位输出,%c字符，%d整型
 
fid=fopen('serial_data.txt','w+'); % 'a+'读写方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之
fprintf(fid,'%2c',out);            % 写入文件中        
fclose(fid);
 
% fclose(s);
% delete(s);
