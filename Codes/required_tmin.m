function [t] = required_tmin(N,Dl_)

t = Dl_/6 + 5/3*log10((2*N-1)/3);
end
