% �������������е�ͨ�˲�
clear;clc;close all;
[y, fs] = audioread('..\data\test.mp3');
sound(y,fs)           % �ط������ź�
n = length(y)         %ѡȡ�任�ĵ��� 
y_p = fft(y, n);      %��n����и���Ҷ�任��Ƶ��
f = fs * (0 : n / 2 - 1) / n;   % ��Ӧ���Ƶ��
figure(1)
subplot(2, 1, 1);
plot(y);                    %�����źŵ�ʱ����ͼ
title('ԭʼ�����źŲ�����ʱ����');
xlabel('ʱ����')
ylabel('��ֵ A')
subplot(2, 1, 2);
plot(f, abs(y_p(1 : n / 2)));     %�����źŵ�Ƶ��ͼ
title('ԭʼ�����źŲ�����Ƶ��ͼ');
xlabel('Ƶ��Hz');
ylabel('Ƶ�ʷ�ֵ');

%����Ƶ�źŲ�������
L = length(y)        %������Ƶ�źŵĳ���
noise = 0.1 * randn(L, 2);  %�����ȳ��ȵ���������ź�(����������Ĵ�Сȡ������������ķ��ȱ�����
y_z = y + noise;        %�������źŵ��ӳ�һ���µ��źš�������������   
pause(5)
sound(y_z, fs)
%�Լ����������źŽ��з���
n = length(y);  %ѡȡ�任�ĵ��� 
y_zp = fft(y_z, n);      %��n����и���Ҷ�任��Ƶ��
f = fs * (0 : n / 2 - 1) / n;   % ��Ӧ���Ƶ��
figure(2)
subplot(2, 1, 1);
plot(y_z);                    %���������źŵ�ʱ����ͼ
title('���������ź�ʱ����');
xlabel('ʱ����')
ylabel('��ֵ A')
subplot(2, 1, 2);
plot(f, abs(y_zp(1 : n / 2)));     %���������źŵ�Ƶ��ͼ
title('���������ź�Ƶ��ͼ');
xlabel('Ƶ��Hz');
ylabel('Ƶ�ʷ�ֵ');


%�Լ���������źŽ���ȥ��������£�
fp = 1500; fc = 1700; As = 100; Ap = 1;
%(����Ϊ��ͨ�˲���������ָ�꣩
wc = 2 * pi * fc / fs; wp = 2 * pi * fp / fs;
wdel = wc - wp;
beta = 0.112 * (As - 8.7);
N = ceil((As - 8) / 2.285 / wdel);
wn = kaiser(N + 1, beta);
ws = (wp + wc) / 2 / pi;
b = fir1(N, ws, wn);
figure(3);
freqz(b, 1);
title('��ͨ�˲����ķ�Ƶͼ');
xlabel('Ƶ��/hz');
ylabel('����/db');
%����ǰΪ��ͨ�˲�����ƽ׶Σ�����������Ϊȥ�������źŵĳ��򡪡�
x = fftfilt(b, y_z);
X = fft(x, n);
figure(4);
subplot(2, 2, 1);
plot(f, abs(y_zp(1 : n / 2)));
title('�˲�ǰ�źŵ�Ƶ��');
subplot(2, 2, 2);
plot(abs(X));
title('�˲����ź�Ƶ��'); 
subplot(2, 2, 3);
plot(y_z);
title('�˲�ǰ�źŵĲ���')
subplot(2, 2, 4);
plot(x);
title('�˲����źŵĲ���')
pause(5);
sound(x, fs)  %�ط��˲������Ƶ


speechObject = speechClient('Google','languageCode','en-US'); 
outInfo = speech2text(speechObject, y, fs);

