function [R_] = Final_inband_rejection(R,t,N)

R_ = -20*log10(10.^-(R/20) + (2^-t)*sqrt((2*N-1)/3));
 
end