function [decrease] = decreasein_inband(Dl,t,N)

decrease = 20*log10(1 + 2^(Dl/6.02 - t)*sqrt((2*N-1)/3));
end