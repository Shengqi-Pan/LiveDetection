%�½����ڶ���
s1=serial('COM5','BaudRate',115200,'parity','none','databits',8,'stopbits',1); 

%���Դ�������
try
  fopen(s1);  %�򿪴��ڶ���
catch err
  fclose(instrfind);  %�رձ�ռ�õĴ���
  error('��ȷ��ѡ������ȷ�Ĵ���');  %���������ʾ
end
while 1
%     a = fscanf(s1,'%d');  %��ȡ����
%     a = fread(s1);
    if ~isempty(a)
        break;
    end
end
fclose(s1);  %�رմ���
delete(s1);
clear s1;