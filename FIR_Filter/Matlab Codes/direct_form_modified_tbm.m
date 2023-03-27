h0 = -0.00518122868759844;
h1 = 0.0342875832266481;
h2 = 0.144631603006721;
h3 = 0.305466164711475;
h4 = 0.428193249280442;
% h5 = 0.428193249280442;
% h6 = 0.305466164711475;
% h7 = 0.144631603006721;
% h8 = 0.0342875832266481;
% h9 = -0.00518122868759844;

T = 0.002;
dt = 10^-5;
N = T/dt+1;
sample_time = 0:dt:T;

df = (1/dt)/1000;
sample_freq = linspace(-1/2,1/2,N).*df;

% input signal
%freq_cos_1 = 10000; + cos(2*pi*(sample_time)*freq_cos_2)'
freq_cos = 24000;
x_in = cos(2*pi*(sample_time)*freq_cos)';

len = length(x_in);
y_out = zeros(length(x_in),1);

for i=1:length(x_in)
    data = x_in(i);
    %call to the design 'direct_form_lowpass25khz' that is targeted for hardware
    [y_out(i)] = direct_form_lowpass25khz(data,h0,h1,h2,h3,h4);
end


subplot(2,1,1);
plot(sample_time,x_in,'-b');
xlabel('Time (s)')
ylabel('Amplitude')
title("Input Cosine Signal " + " with  " + freq_cos/1000 +" KHz")


subplot(2,1,2); 
plot(sample_time,y_out,'-b');
xlabel('Time (s)')
ylabel('Amplitude')
title("Output Signal (8 bits)")

