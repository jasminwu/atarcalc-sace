function [Scores] = rawToPercent(Scores, numberOf10Credits, numberOf20Credits)
%rawToPercent divides scaled score by the number of credits so performance
%across 10 and 20 cred subjects can be compared

    for i = 1:numberOf10Credits
        Scores(i) = Scores(i)*10;
    end
    for i = numberOf10Credits+1:numberOf20Credits+numberOf10Credits
        Scores(i) = Scores(i)*5;
    end

end