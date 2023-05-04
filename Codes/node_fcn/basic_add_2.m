function [out] = basic_add_2(in1,in2)
F = fimath('SumMode','SpecifyPrecision','SumWordLength',16,'SumFractionLength',14);
    out = add(F,in1,in2);
end
