delete(instrfindall) %%关闭没用的，这句很重要 

s=serial('COM5','BaudRate',115200,'parity','none','databits',8,'stopbits',1); 

fopen(s);%打开串口
data = fread(s,8,'uint8');%读取二进制字节 fwrite二进制写入 相应文本用fscanf 和fpintf

%data %进行数据处理

fclose(s);
delete(s);
clear s;