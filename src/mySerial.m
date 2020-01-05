%本函数用于读串口数据
classdef mySerial
    properties
        s % 串口
        out % 读到的数转为高低十进制
        result % 最终输出的有效十进制
        acc_signal = [] % 将先后读到的result以向量保存
    end
    methods
        function this = init(this)
            this.s = serial('com7');
            this.s.BytesAvailableFcnMode = 'byte';  % 串口设置
            this.s.InputBufferSize = 4096;
            this.s.OutputBufferSize = 1024;
            this.s.BytesAvailableFcnCount = 100;
            set(this.s,'BaudRate',115200,'Parity','none','DataBits',8,'StopBits',1);  %波特率为115200bp，8位数据，无校验位
            fopen(this.s);                  %打开串口
        end
        function this = read(this)
            this.out = fread(this.s,2,'uint8');   %一次读出10个字符
            this.result = this.out(1)*256+this.out(2);     %转换为一个十进制数
            fprintf('%2d',this.result);        %输出结果
            this.acc_signal = [this.acc_signal, this.result];
            % fid=fopen('serial_data.txt','w+'); % 'a+'读写方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之
            % fprintf(fid,'%2d',this.result);            % 写入文件中        
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