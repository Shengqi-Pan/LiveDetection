%���������ڶ���������
classdef mySerial
    properties
        s % ����
        out % ��������תΪ�ߵ�ʮ����
        result % �����������Чʮ����
        acc_signal = [] % ���Ⱥ������result����������
    end
    methods
        function this = init(this,com)
            this.s = serial(com);
            this.s.BytesAvailableFcnMode = 'byte';  % ��������
            this.s.InputBufferSize = 4096;
            this.s.OutputBufferSize = 1000;
            this.s.BytesAvailableFcnCount = 100;
            set(this.s,'BaudRate',115200,'Parity','none','DataBits',8,'StopBits',1);  %������Ϊ115200bp��8λ���ݣ���У��λ
            fopen(this.s);                  %�򿪴���
        end
        function this = read(this)
            this.out = fread(this.s,2,'uint8');   %һ�ζ���10���ַ�
            this.result = this.out(1)*256+this.out(2);     %ת��Ϊһ��ʮ������
            fprintf('%2d',this.result);        %������
            this.acc_signal = [this.acc_signal, this.result];
            % fid=fopen('serial_data.txt','w+'); % 'a+'��д��ʽ�򿪣����ļ�ָ��ָ���ļ�ĩβ������ļ����������Դ���֮
            % fprintf(fid,'%2d',this.result);            % д���ļ���        
            % fclose(fid);
        end     
        function this = save(this)
            save('..\data\data.mat','this.acc_signal');
        end
        function this = close(this)
            fclose(this.s);
            delete(this.s);
        end
    end
end