function [subjects, scaledScores] = getSubjectScores(numberOfCredits, cumSubjectCount)
    % GETSUBJECTSCORES this function gets subject name and scaled score
    % from user

    % asks number of subjects and initalises matrices
    numberOfSubjects = input("How many "+numberOfCredits+" credit subjects did you do? ");
    subjects = strings(numberOfSubjects, 1);
    scaledScores = zeros(numberOfSubjects, 1);
    
    % receives input
    for i = 1:numberOfSubjects
        % ensures subject count is cumulative
        subjectNumber = i + cumSubjectCount;
        subjects(i, 1) = input("Please enter the name of subject "+subjectNumber+": ", "s");
        scaledScores(i, 1) = input("Please enter the scaled score of subject "+subjectNumber+": ");
            while scaledScores(i, 1) > numberOfCredits || scaledScores(i, 1) < 0
                scaledScores(i, 1) = input("Score is between 0 and "+numberOfCredits+" Please enter the scaled score of subject "+subjectNumber+": ");
            end
    end
end

