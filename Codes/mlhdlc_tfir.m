
%h_in1,h_in2,h_in3,h_in4,h_in5,h_in6,h_in7,h_in8,h_in9,h_in10
%#codegen
function [y_out] = mlhdlc_tfir(x_in,h)   
% Symmetric FIR Filter Transpose Form

% declare and initialize the delay registers
persistent ud1 ud2 ud3 ud4 ud5 ud6 ud7 ud8 ud9 ud10 ud11 ud12 ud13 ud14 ud15 ud16 ud17 ud18 ud19 ud20 ...
ud21 ud22 ud23 ud24 ud25 ud26 ud27 ud28 ud29 ud30 ud31 ud32 ud33 ud34 ud35 ud36 ud37 ud38 ud39 ud40 ...
ud41 ud42 ud43 ud44 ud45 ud46 ud47 ud48 ud49 ud50;
if isempty(ud1)
    ud1 = 0; ud2 = 0; ud3 = 0; ud4 = 0; ud5 = 0; ud6 = 0; ud7 = 0; ud8 = 0;
    ud9 = 0; ud10 = 0; ud11 = 0; ud12 = 0; ud13 = 0; ud14 = 0; ud15 = 0; ud16 = 0;
    ud17 = 0; ud18 = 0; ud19 = 0; ud20 = 0;
    ud21 = 0; ud22 = 0; ud23 = 0; ud24 = 0; ud25 = 0; ud26 = 0; ud27 = 0; ud28 = 0;
    ud29 = 0; ud30 = 0; ud31 = 0; ud32 = 0; ud33 = 0; ud34 = 0; ud35 = 0; ud36 = 0;
    ud37 = 0; ud38 = 0; ud39 = 0; ud40 = 0;
    ud41 = 0; ud42 = 0; ud43 = 0; ud44 = 0; ud45 = 0; ud46 = 0;
    ud47 = 0; ud48 = 0; ud49 = 0; ud50 = 0;
end

% access the previous value of states/registers
y_out = ud1 + ud7 + ud13 + ud19 + ud25 + ud30 + ud34 + ud38 + ud42 + ud46;




% adder ch
 


% update the delay line
ud46 = ud41;
ud47 = ud42;
ud48 = ud43;
ud49 = ud44;
ud50 = ud45;

ud41 = ud36;
ud42 = ud37;
ud43 = ud38;
ud44 = ud39;
ud45 = ud40;

ud36 = ud31;
ud37 = ud32;
ud38 = ud33;
ud39 = ud34;
ud40 = ud35;

ud31 = ud26;
ud32 = ud27;
ud33 = ud28;
ud34 = ud29;
ud35 = ud30;

ud26 = ud21;
ud27 = ud22;
ud28 = ud23;
ud29 = ud24;
ud30 = ud25; 

ud21 = ud16;
ud22 = ud17;
ud23 = ud18;
ud24 = ud19;
ud25 = ud20; 

ud16 = ud11;
ud17 = ud12;
ud18 = ud13;
ud19 = ud14;
ud20 = ud15; 

ud11 = ud6;
ud12 = ud7;
ud13 = ud8;
ud14 = ud9;
ud15 = ud10; 
 
ud6 = ud1;
ud7 = ud2;
ud8 = ud3;
ud9 = ud4; 
ud10 = ud5;

ud1 = x_in*h(1);
ud2 = x_in*h(2);
ud3 = x_in*h(3);
ud4 = x_in*h(4);
ud5 = x_in*h(5);
end