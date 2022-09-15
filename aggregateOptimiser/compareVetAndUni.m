function [vetScore, aggregateScores] = compareVetAndUni(tenCredScaledNew, vetScore, twentyCredScaledNew, aggregateScores, conditionalVET, twoHighest);
%UNTITLED Summary of this function goes here

% if no vet score
if conditionalVET == 0 
    % calculate remaining 30 credits of subject scores using headstart +
    % other subjects
    [aggregateScores] = remaining30(aggregateScores, twentyCredScaledNew, tenCredScaledNew);

% if headstart better than vet score
elseif sum(twoHighest) > max(vetScore) || max(twoHighest) > (0.5 * max(vetScore))
    % remove vet score
    for i = 1:length(twoHighest)
        tenCredScaledNew = [tenCredScaledNew; twoHighest(i)];
        aggregateScores(5) = [];
    end
% calculate remaining 30 credits of subject scores using headstart +
    % other subjects
   [aggregateScores] = remaining30(aggregateScores, twentyCredScaledNew, tenCredScaledNew);
end

end
