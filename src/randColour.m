function [colour] = randColour(numberOfColours)
%randColour generates n*3 random numbers and stores in colour vector for
%later use

for i = 1:(numberOfColours+2)
    colour(i) = rand();
end

end