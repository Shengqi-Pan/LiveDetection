% ���ڴ��ڲ��Եĵ����ļ���ûɶ��
s=serial('com7');
s.BytesAvailableFcnMode='byte';  % ��������
s.InputBufferSize=4096;
s.OutputBufferSize=1024;
s.BytesAvailableFcnCount=100;
set(s,'BaudRate',115200,'Parity','none','DataBits',8,'StopBits',1);  %������Ϊ115200bp��8λ���ݣ���У��λ
fopen(s);                  %�򿪴���
out=fread(s,2,'uint8');   %һ�ζ���10���ַ�  
fprintf('%2c',out);        %һ���ַ�ռ��λ���,%c�ַ���%d����
 
fid=fopen('serial_data.txt','w+'); % 'a+'��д��ʽ�򿪣����ļ�ָ��ָ���ļ�ĩβ������ļ����������Դ���֮
fprintf(fid,'%2c',out);            % д���ļ���        
fclose(fid);
 
% fclose(s);
% delete(s);
