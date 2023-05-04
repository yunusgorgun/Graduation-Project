%fi(-0.0026917,1,8,6),fi(-0.010748,1,8,6),fi(-0.0019111,1,8,6),fi(0.0059093,1,8,6),fi(0.010107,1,8,6),fi(0.0023736,1,8,6),fi(-0.0096452,1,8,6),fi(-0.012139,1,8,6),fi(-0.00095131,1,8,6),fi(0.01197,1,8,6)
% cffs = fi([-0.018278,-0.035583,-0.053371,-0.057153,-0.033569,0.024866,0.11415,0.21731,0.3086,0.36225],1,8,6);
% cffs = num2cell(cffs);

%  q_8 = quantizer('fixed','floor','saturate',[8 6]);
%  q_12 = quantizer('fixed','floor','saturate',[12 10]);
%q_16 = quantizer('fixed','floor','saturate',[16 14]);
%  q_24 = quantizer('fixed','floor','saturate',[24 20]);

cutoff=450;
tap = 120;
T = 0.2;
fs = 2000;
dt = 1/fs;
N = T/dt+1;


sample_time = 0:dt:T;
t = 0:dt:T*4;



df = 1/dt;
sample_freq = linspace(-1/2,1/2,N).*df;
freq_cos=500;
cof=cutoff*2*T+1;
start = 2*T*fs + tap/2;
finish = start + fs*T;
k = fs/(2*T);
freq_axis = ((0:dt:T).*k);
% input signal 
%x_in = cos(2.*pi.*(t).*freq_cos).';
 

x_in = cos(pi.*(t).*(t).*k);



len = length(x_in);
y = zeros(1,len);
y_8 = zeros(1,len);
y_12 = zeros(1,len);
y_16 = zeros(1,len);
y_20 = zeros(1,len);
y_24 = zeros(1,len);
y_28 = zeros(1,len);

h=c300_120_107dB;
len_h = length(h)/2;


for i=1:len
    x = x_in(i);
    [y(i)] = auto_lowpass_false(x,h{1:len_h});
end
y = y(start:finish);
h = cell2mat(h);

h_8 = fi(h,1,8,6);
h_8 = num2cell(h_8);
for i=1:len
    x = x_in(i);
    [y_8(i)] = auto_lowpass_false(x,h_8{1:len_h});
end
y_8 = y_8(start:finish);


h_12 = fi(h,1,12,10);
h_12 = num2cell(h_12);
for i=1:len
    x = x_in(i);
    [y_12(i)] = auto_lowpass_false(x,h_12{1:len_h});
end
y_12 = y_12(start:finish);

h_16 = fi(h,1,16,14);
h_16 = num2cell(h_16);
for i=1:len
    x = x_in(i);
    [y_16(i)] = auto_lowpass_false(x,h_16{1:len_h});
end
y_16 = y_16(start:finish);    

% h_20 = fi(h,1,20,18);
% h_20 = num2cell(h_20);
% for i=1:len
%     x = x_in(i);
%     [y_20(i)] = auto_lowpass_false(x,h_20{1:len_h});
% end
% y_20 = y_20(start:finish);
% 
% h_24 = fi(h,1,24,22);
% h_24 = num2cell(h_24);
% for i=1:len
%     x = x_in(i);
%     [y_24(i)] = auto_lowpass_false(x,h_24{1:len_h});
% end
% y_24 = y_24(start:finish);
% 
% h_28 = fi(h,1,28,26);
% h_28 = num2cell(h_28);
% for i=1:len
%     x = x_in(i);
%     [y_28(i)] = auto_lowpass_false(x,h_28{1:len_h});
% end
% y_28 = y_28(start:finish);

%plot(sample_time(cof:end),y_8(cof:end))

p_8 = abs((y_8-y));
p_12 = abs((y_12-y));
p_16 = (y_16-y);
% p_20 = abs((y_20-y));
% p_24 = abs((y_24-y));
% p_28 = abs((y_28-y));

% s =  sum (y(cof:end).^2);
% s_8 = 10*log10(s/sum(p_8(cof:end).^2));
% s_12 = 10*log10(s/sum(p_12(cof:end).^2));
% s_16 = 10*log10(s/sum(p_16(cof:end).^2));
% s_20 = 10*log10(s/sum(p_20(cof:end).^2));
% s_24 = 10*log10(s/sum(p_24(cof:end).^2));
% s_28 = 10*log10(s/sum(p_28(cof:end).^2));

% m =  sum (y(1:cof-1).^2);
% m_8 = 10*log10(s/sum(p_8(1:cof-1).^2));
% m_12 = 10*log10(s/sum(p_12(1:cof-1).^2));
% m_16 = 10*log10(s/sum(p_16(1:cof-1).^2));

% plot(freq_axis,p_8)
% hold on
% plot(freq_axis,p_12)
% hold on
% plot(freq_axis,p_16)
% 
% 
% 
% 
% 
% ylabel('Absolute Error in Magnitude')
% xlabel('Frequency(Hz)')
% %title('Error Comparision of Different Quantizations on 20-tap FIR Lowpass Filter(Direct) via MATLAB Outputs')
% legend("Error-8bit,"+sprintf('stopband SNRdb= %.3f',s_8),"Error-12bit,"+sprintf('stopband SNRdb= %.3f',s_12),"Error-16bit,"+sprintf('stopband SNRdb= %.3f,',s_16),'Location','best')



freq_fft = @(x) abs(fftshift(fft(x)));

subplot(1,1,1); 
semilogy(fft_shift(sample_freq),abs(fft(p_16)),'-b');
