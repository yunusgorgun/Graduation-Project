%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB test bench for the FIR filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = 2;
dt = 10^-5;
N = T/dt+1;
sample_time = 0:dt:T;

df = (1/dt)/1000;
sample_freq = linspace(-1/2,1/2,N).*df;

% input signal 
%freq_cos_1 = 10000; + cos(2*pi*(sample_time)*freq_cos_2)'
freq_cos = 35000;
x_in =  cos(2*pi*(sample_time)*freq_cos)';



len = length(x_in);
y_out = zeros(1,len);
y_8out = zeros(1,len);
y_10out = zeros(1,len);
y_14out = zeros(1,len);


for ii=1:len
    data = x_in(ii);
    % call to the design 'mlhdlc_sfir' that is targeted for hardware
    [y_out(ii)] = mlhdlc_tfir(data, Coeffs);
end
E = sum(abs(y_out(11:end)).^2);
P = E/(len-10);


q_8 = quantizer('fixed','floor','saturate',[8 6]);
x_in_8quantized = hex2num(q_8,num2hex(q_8,x_in));
Coeffs_8quantized = hex2num(q_8,num2hex(q_8,Coeffs));

for ii=1:len
    data = x_in_8quantized(ii);
    % call to the design 'mlhdlc_sfir' that is targeted for hardware
    [y_8out(ii)] = mlhdlc_tfir(data, Coeffs_8quantized);
end
E_8 = sum(abs(y_8out(11:end)).^2);
P_8 = E_8/(len-10);


q_10 = quantizer('fixed','floor','saturate',[10 8]);
x_in_10quantized = hex2num(q_10,num2hex(q_10,x_in));
Coeffs_10quantized = hex2num(q_10,num2hex(q_10,Coeffs));

for ii=1:len
    data = x_in_10quantized(ii);
    % call to the design 'mlhdlc_sfir' that is targeted for hardware
    [y_10out(ii)] = mlhdlc_tfir(data, Coeffs_10quantized);
end
E_10 = sum(abs(y_10out(11:end)).^2);
P_10 = E_10/(len-10);

bit_num = 14;
q_14 = quantizer('fixed','floor','saturate',[14 12]);
x_in_14quantized = hex2num(q_14,num2hex(q_14,x_in));
Coeffs_14quantized = hex2num(q_14,num2hex(q_14,Coeffs));

for ii=1:len
    data = x_in_14quantized(ii);
    % call to the design 'mlhdlc_sfir' that is targeted for hardware
    [y_14out(ii)] = mlhdlc_tfir(data, Coeffs_14quantized);
end
E_14 = sum(abs(y_14out(11:end)).^2);
P_14 = E_14/(len-10);

figure('Name', [mfilename, '_plot']);
subplot(5,1,1);
plot(sample_time,x_in,'-c');
xlabel('Time (s)')
ylabel('Amplitude')
title("Input Cosine Signal " + " with  " + freq_cos/1000 +" KHz")


subplot(5,1,2); 
plot(sample_time,y_8out,'-c');
xlabel('Time (s)')
ylabel('Amplitude')
title("Output Signal (8 bits)" + " Energy="+E_8+" Power="+P_8)

subplot(5,1,3); 
plot(sample_time,y_10out,'-c');
xlabel('Time (s)')
ylabel('Amplitude')
title("Output Signal (10 bits)" + " Energy="+E_10+" Power="+P_10)

subplot(5,1,4); 
plot(sample_time,y_14out,'-c');
xlabel('Time (s)')
ylabel('Amplitude')
title("Output Signal (14 bits)" + " Energy="+E_14+" Power="+P_14)

subplot(5,1,5); 
plot(sample_time,y_14out,'-c');
xlabel('Time (s)')
ylabel('Amplitude')
title("Output Signal (No Quantization)" + " Energy="+E+" Power="+P)



