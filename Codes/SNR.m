function [SNR] = SNR(R,t,N)

    R = 10.^-(R/20);

    R_ = R + (2^-t)*sqrt((2*N-1)/3);

    SNR = 10*log10((R.^2)./(R_-R).^2);

end