function [y] = restrictedAdder2(x)
F = fimath('SumMode', 'SpecifyPrecision','SumWordLength',8,...
'SumFractionLength',6);
temp = add(F,x,x);
temp2 = add(F,temp,x);
y = add(F,temp2,x);
end

