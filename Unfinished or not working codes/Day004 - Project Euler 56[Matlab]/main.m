%Project Euler 56 - Powerful digit sum
%A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost 
%unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the 
%digits in each number is only 1.
%
%Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
clear;

maxDigitalSum = 0;
maxNumber = 0;
for i=1:99
    for j=1:99
        sum = CalculateSumOfDigits(power(i,j));
        if sum > maxDigitalSum
            maxDigitalSum = sum;
            maxNumber = power(i,j);
        end
    end
end