function [y] = regularAdder(x)
temp = basic_add(x,x);
y = basic_add(temp,x);
end

