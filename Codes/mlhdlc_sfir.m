
%h_in1,h_in2,h_in3,h_in4,h_in5,h_in6,h_in7,h_in8,h_in9,h_in10
%#codegen
function [y_out] = mlhdlc_sfir(x_in,h)   
% Symmetric FIR Filter Direct Form

% declare and initialize the delay registers
persistent ud1 ud2 ud3 ud4 ud5 ud6 ud7 ud8 ud9 ud10;
if isempty(ud1)
    ud1 = 0; ud2 = 0; ud3 = 0; ud4 = 0; ud5 = 0; ud6 = 0; ud7 = 0; ud8 = 0;
    ud9 = 0; ud10 = 0;
end

% access the previous value of states/registers
a1 = ud1 + ud10; a2 = ud2 + ud9;
a3 = ud3 + ud8; a4 = ud4 + ud7;
a5 = ud5 + ud6;

% multiplier chain
m1 = h(1) * a1; m2 = h(2) * a2;
m3 = h(3) * a3; m4 = h(4) * a4;
m5 = h(5) * a5;

% adder chain
a5 = m1 + m2; a6 = m3 + m4;
a7 = m5 + a5;

% filtered output
y_out = a7 + a6;

% update the delay line
ud10 = ud9;
ud9 = ud8;
ud8 = ud7; 
ud7 = ud6;
ud6 = ud5;
ud5 = ud4;
ud4 = ud3;
ud3 = ud2;
ud2 = ud1;
ud1 = x_in;
end