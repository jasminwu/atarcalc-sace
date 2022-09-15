function [aggregateScores, vetScore, twentyCredScaledNew] = vetCourseCalc(aggregateScores,twentyCredScaledNew, tenCredScaledNew)

% vetCourseCalc finds best 70 creds, finds average and then calculates the
% vet scaled score

    % we want to find the best 70 credits so we can calc vet score
    % length < 4, because [20 20 20 10] = 70
    while length(aggregateScores) < 4 
        if max(twentyCredScaledNew) >= 2 * max(tenCredScaledNew)
            [val, location] = max(twentyCredScaledNew);
            aggregateScores = [aggregateScores val/2];
            twentyCredScaledNew(location) = [];
            tenCredScaledNew = [tenCredScaledNew; val/2];
        else 
            [val, location] = max(tenCredScaledNew);
            aggregateScores = [aggregateScores val];
            tenCredScaledNew(location) = [];
        end
    end
    vetScore = sum(aggregateScores)/3.5; % score is avg of best 70 creds
    % add vet score to aggregateScores
    aggregateScores(5) = vetScore/2; % for loop unnecessary here as its only done twice
    aggregateScores(6) = vetScore/2;

end