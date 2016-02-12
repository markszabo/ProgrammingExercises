function sum = CalculateSumOfDigits(number)
    sum = 0;
    while(number > 0)
        sum = sum + mod(number,10);
        number = (number - mod(number,10))/10;
    end
end