q = quantizer('fixed','floor','saturate',[8 6]);
T = 2;
dt = 0.001;
N = T/dt+1;
sample_time = 0:dt:T;
x_in = cos(2.*pi.*(sample_time).*(1+(sample_time).*75)).';
plot(1:length(x_in),x_in,'-b');
hold on
x_in_2=num2hex(q,x_in);
x_in_2=hex2num(q,x_in_2);
plot(1:length(x_in),x_in_2-x_in,'-r');
Summ = sum(abs(x_in-x_in_2));
%%
Coeffs = cell2mat(coeffs_300_20);
q_8 = quantizer('fixed','floor','saturate',[8 6]);
Coeffs_8_bits = hex2num(q_8,num2hex(q_8,Coeffs));

q_10 = quantizer('fixed','floor','saturate',[10 8]);
Coeffs_10_bits = hex2num(q_10,num2hex(q_10,Coeffs));

q_14 = quantizer('fixed','floor','saturate',[14 12]);
Coeffs_14_bits = hex2num(q_14,num2hex(q_14,Coeffs));

q_16 = quantizer('fixed','floor','saturate',[16 14]);
Coeffs_16_bits = hex2num(q_16,num2hex(q_16,Coeffs));


freqz(Coeffs,1)
hold on
freqz(Coeffs_8_bits',1)
hold on
freqz(Coeffs_10_bits',1)
hold on
freqz(Coeffs_14_bits',1)
hold on
freqz(Coeffs_16_bits',1)
hold on

lines = findall(gcf,'type','line');
lines(1).Color = 'red';
lines(2).Color = 'green';
lines(3).Color = 'blue';
lines(4).Color = 'cyan';
lines(5).Color = 'magenta';
legend("Original","8bits","10bits","14bits","16bits","Location","best")