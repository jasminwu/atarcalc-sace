function [aggregateScores] = remaining30(aggregateScores, twentyCredScaledNew, tenCredScaledNew)
% finds best 30 remaining credits 
% the 3 remaining items in the vector will be 10 cred scores
% so we want 6 items in the vct
    while length(aggregateScores) < 6 
        % if the 4th 20 cred subject is better than the max 10 cred
        % subject

        % we want to check if the highest 20 cred is larger than 1/2 of the
        % highest 10 cred

        % prevents errors
        if isempty(twentyCredScaledNew)
            maxTwenty = 0;
        else
            maxTwenty = max(twentyCredScaledNew);
        end

        if isempty(tenCredScaledNew);
            maxTen = 0;
        else
            maxTen = max(tenCredScaledNew);
        end
        

        % USE 20 CRED
        if maxTen == 0 || maxTwenty > (2 * maxTen) 
            [val, location] = max(twentyCredScaledNew);
            % concatenates onto aggregateScores (used for atar)
            aggregateScores = [aggregateScores val/2]; 
            twentyCredScaledNew(location) = []; % max is removed from array
            % but since it's 20 credit, all 20 cred can be used so half
            % the value is sent to the 10 cred array
            tenCredScaledNew = [tenCredScaledNew; val/2]; 
        else 
            % use max 10 cred for aggregate instead
            [val, location] = max(tenCredScaledNew);
            % concatenate horizontally
            aggregateScores = [aggregateScores val];
            tenCredScaledNew(location) = []; % delete max
        end
    end

end