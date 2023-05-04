
N = 20;
Dk = 30:1:50;
plot(Dk,SNR(Dk,6,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,10,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,14,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,18,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,22,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,26,N),'LineWidth',2)
hold on
plot(33.207,[2.3149,22.47,44.9939,71.1878,95.2732,118.743],'r*')
hold on
plot(Dk,-1.1483*Dk + 39.3636,"--k")
hold on
plot(40.3837,[-7.9625,21.0773,43.935,64.1573,91.1684,116.6031],'r*')
hold on
plot(Dk,-0.9181*Dk + 54.8175,"--k")
hold on
plot(43.2073,[-12.3199,15.1720,41.9039,62.7060,86.0434,111.0614],'r*')
hold on
plot(Dk,-0.9388*Dk + 78.7761,"--k")
hold on
plot(46.7447,[-12.9945,12.2852,32.0332,58.6203,82.1851,105.7208],'r*')
hold on
plot(Dk,-0.8679*Dk + 99.7771,"--k")
hold on
plot(48.8318,[-16.0927,8.1109,31.6366,57.8895,80.0842,107.7717],'r*')
hold on
plot(Dk,-1.0078*Dk + 129.7582,"--k")
hold on
plot(Dk,-0.8464*Dk + 147.9326,"--k")
ylabel('lowerbound SNR(dB)')
xlabel('passband attenuation(dB)')
legend('t = 6','t = 10', 't = 14', 't = 18', 't = 22', 't = 26')

%%
N = 120;
Dk = 100:1:130;
plot(Dk,SNR(Dk,6,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,10,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,14,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,18,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,22,N),'LineWidth',2)
hold on
plot(Dk,SNR(Dk,26,N),'LineWidth',2)
hold on
plot(107.7787,[-80,-60,-36,-12,11,34],'r*')
hold on
% plot(Dk,-0.9536*Dk + 31.4555,"--k")
% hold on
% plot(35.9003,[-4.3719,20.1786,45.113,68.1044,94.7277,117.5028],'r*')
% hold on
% % plot(Dk,-0.9128*Dk + 52.6466,"--k")
% % hold on
% plot(38.73,[-5.9604,15.7576,45.1812,66.0016,91.4573,115.8261],'r*')
% hold on
% % plot(Dk,-1.139*Dk + 86.4151,"--k")
% % hold on
% plot(42.014,[-7.4014,13.8634,37.2636,63.8611,91.441,111.1561],'r*')
% hold on
% % plot(Dk,-0.7134*Dk + 93.7583,"--k")
% % hold on
% plot(45.4535,[-12.2409,12.0277,34.4066,61.3352,84.1129,108.0023],'r*')
% hold on
% plot(Dk,-0.9198*Dk + 127.5511,"--k")
% hold on
% plot(Dk,-1.1149*Dk + 158.4385,"--k")
ylabel('lowerbound SNR(dB)')
xlabel('passband attenuation(dB)')
legend('t = 6','t = 10', 't = 14', 't = 18', 't = 22', 't = 26')
%%
N = 120;
Dk = 0:1:120;
plot(Dk,Final_inband_rejection(Dk,6,N),'LineWidth',2)
hold on
plot(Dk,Final_inband_rejection(Dk,10,N),'LineWidth',2)
hold on
plot(Dk,Final_inband_rejection(Dk,14,N),'LineWidth',2)
hold on
plot(Dk,Final_inband_rejection(Dk,18,N),'LineWidth',2)
hold on
plot(Dk,Final_inband_rejection(Dk,22,N),'LineWidth',2)
hold on
plot(Dk,Final_inband_rejection(Dk,26,N),'LineWidth',2)
ylabel('Quantized Attenuation Lowerbound(dB)')
xlabel('Unquantized Attenuation(dB)')
legend('t = 6','t = 10', 't = 14', 't = 18', 't = 22', 't = 26','Location','best')
%%
N = 1:140;
plot(N,required_tmin(N,20))
hold on
plot(N,required_tmin(N,40))
hold on
plot(N,required_tmin(N,60))
xlabel('Number of Taps')
ylabel('Number of Minimum Required Bits')
lgd = legend('Dk_ = 20db','Dk_ = 40db', 'Dk_ = 60db',Location='best');
title(lgd,'Passband Rejection')
%%
N = 200:300;
plot(N,decreasein_inband(40,30,N))
hold on
plot(N,decreasein_inband(60,30,N))
legend('Stopband', 'Passband')