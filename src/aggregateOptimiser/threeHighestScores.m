function [aggregateScores, twentyCredScaledNew] = threeHighestScores(aggregateScores, twentyCredScaledNew)
%THREEHIGHESTSCORES this function finds the 3 highest scores in an array of
%20 credit subjects, and stores them in a array for later use

index = 1;
    while length(aggregateScores) < 3 % 3 best 20 credit subjects must be counted towards ATAR as per satac rules
        % via https://stackoverflow.com/questions/13531009/how-can-i-find-the-maximum-value-and-its-index-in-array-in-matlab
        [val, location] = max(twentyCredScaledNew); % find max 20 cred subject
        % below is own code
        aggregateScores(index) = val; % add to aggregateScores
        twentyCredScaledNew(location) = []; % delete value from mat
        index = index + 1; % increase index by 1
    end

end