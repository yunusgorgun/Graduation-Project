function [output] = coeff_symmetry_checker(coeffs)

cond_1 = true;  % even and symmetric
cond_2 = true;  % odd and symmetric

    if mod(length(coeffs),2) == 0
        cond_2 = false;
         for i=1:length(coeffs)/2
             cond_1 = and(cond_1 , coeffs(i)==coeffs(length(coeffs)-i+1));
         end
    else
        cond_1 = false;
         for i=1:length(coeffs)/2
             cond_2 = and(cond_2 , coeffs(i)==coeffs(length(coeffs)-i+1));
         end
    end

    if or(cond_1,cond_2) == false    % not symmetric case
        output = 'unsymmetric';
    elseif cond_1   % even symmetric
        output = 'even_symmetric';
    else
        output = 'odd_symmetric';
    end


end