function [xCredSubjects,xCredScaled, conditionalVET, prevSubjectCount, uniExt] = subjectsAndScores(numOfCredits,numOfSubjects, conditionalVET, prevSubjectCount, uniExt)
%subjectsAndScores This function gets subjects and scores from the user and
%returns these values for later use

% Works for both 10 and 20 credit subjects

% makes sure the user enters more than 1 subject
if numOfCredits == 10
    % makes sure user is including research project
    while numOfSubjects < 1
        disp("You won't get your SACE. Have you considered TAFE?");
        numOfSubjects = input("Now, how many "+numOfCredits+" credit subjects did you do? ");
    end
elseif numOfCredits == 20
    % makes sure user is doing enough subjects
    while (numOfSubjects < 4 && conditionalVET == 0 && uniExt == 0)|| ((conditionalVET == 1 || uniExt > 2) && numOfSubjects < 3) 
        disp("You won't get an ATAR. Have you considered TAFE?");
        numOfSubjects = input("Now, how many 20 credit subjects did you do? ");
    end 
end

% initialises subject & scores matrices
xCredSubjects = strings(numOfSubjects, 1);
xCredScaled = zeros(numOfSubjects, 1);
    
for i = 1:numOfSubjects
    subjectCount = prevSubjectCount + i;   % ensures subject count is cumulative
    xCredSubjects(i, 1) = input("Please enter the name of subject "+subjectCount+": ", "s");
    xCredScaled(i, 1) = input("Please enter the scaled score of subject "+subjectCount+": ");
        % ensures correct score
        while xCredScaled(i, 1) > numOfCredits || xCredScaled(i, 1) < 0
            xCredScaled(i, 1) = input("Score is between 0 and "+numOfCredits+". Please enter the scaled score of subject "+subjectCount+": ");
        end
end

end