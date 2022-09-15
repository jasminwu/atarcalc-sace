function [tenCredScaledNew, twoHighest] = findMaxHeadstart(newHeadstartGrade, tenCredScaledNew, uniExt)
%findMaxHeadstart checks whether the two best headstart scores provide a
%better alternative to the vet score
if uniExt <= 2
    twoHighest = newHeadstartGrade;
else 
    % FIND BEST HEADSTART SCORES if 3-4 headstart subjects
    twoHighest = [];
    while length(twoHighest) < 2
        [val, location] = max(newHeadstartGrade);
        twoHighest = [twoHighest val];
        newHeadstartGrade(location) = [];
    end
end

% concatenate uni scores onto ten credit scaled
for i = 1:length(twoHighest)
    tenCredScaledNew = [tenCredScaledNew; twoHighest(i)];
end  

end

