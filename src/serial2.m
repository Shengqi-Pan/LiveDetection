delete(instrfindall) %%�ر�û�õģ�������Ҫ 

s=serial('COM5','BaudRate',115200,'parity','none','databits',8,'stopbits',1); 

fopen(s);%�򿪴���
data = fread(s,8,'uint8');%��ȡ�������ֽ� fwrite������д�� ��Ӧ�ı���fscanf ��fpintf

%data %�������ݴ���

fclose(s);
delete(s);
clear s;