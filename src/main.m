clear
clc

% welcome, instructions
disp("Welcome to the SACE ATAR Calculator. Your estimated ATAR will be calculated using 2021 data. ");

% vet course
vetCourse = input("Have you completed a VET course that is Cert III or above? (Y/N)? ", "s");
[conditionalVET, VET, vetScore] = initialiseVetCourse(vetCourse);

% uni extension courses
uniExt = input("How many university extension courses (e.g. Headstart) have you completed? ");
[uniExt, headstartName, headstartGrade] = initialiseUni(uniExt);

% TAS SUBJECTS 
% 10 credit subjects
prevSubjectCount = uniExt;
numberOf10Cred = input("How many 10 credit subjects did you do? ");
[tenCredSubjects,tenCredScaled, conditionalVET, prevSubjectCount, uniExt] = subjectsAndScores(10,numberOf10Cred, conditionalVET, prevSubjectCount, uniExt);

% 20 credit subjects
prevSubjectCount = prevSubjectCount + numberOf10Cred;
numberOf20Cred = input("How many 20 credit subjects did you do? ");
[twentyCredSubjects,twentyCredScaled, conditionalVET, prevSubjectCount, uniExt] = subjectsAndScores(20,numberOf20Cred, conditionalVET, prevSubjectCount, uniExt);
  

% TIME TO WORK OUT THE AGGREGATE
    % doesnt affect original array so deletion doesnt ruin concatenation
    twentyCredScaledNew = twentyCredScaled;
    tenCredScaledNew = tenCredScaled;
    newHeadstartGrade = headstartGrade;

% add scores together to form aggregate
% find 3 highest scores from 20 credit subjects
aggregateScores = []; % initialises aggregate scores matrix
[aggregateScores, twentyCredScaledNew] = threeHighestScores(aggregateScores, twentyCredScaledNew);

if conditionalVET == 0 && uniExt == 0
    [aggregateScores] = remaining30(aggregateScores, twentyCredScaledNew, tenCredScaledNew);
    % vet course 
elseif conditionalVET == 1 
    [aggregateScores, vetScore, twentyCredScaledNew] = vetCourseCalc(aggregateScores,twentyCredScaledNew, tenCredScaledNew);
end

% if user did uni extension subjects
if uniExt ~= 0
    % make another copy of 10 cred scores
    tenCredScaled2 = tenCredScaled;
    twentyCredScaled2 = twentyCredScaled;
    % find max headstart scores
    [tenCredScaled2, twoHighest] = findMaxHeadstart(newHeadstartGrade, tenCredScaled2, uniExt);
    % calc new aggregate      
    [vetScore, aggregateScores] = compareVetAndUni(tenCredScaled2, vetScore, twentyCredScaledNew, aggregateScores, conditionalVET, twoHighest);
end


% show user summary
    Subjects = vertcat(tenCredSubjects, headstartName,twentyCredSubjects, VET);
    Scores = vertcat(tenCredScaled, headstartGrade, twentyCredScaled, vetScore);
    userSummary(Subjects,Scores);

aggregateTotal = sum(aggregateScores);
% print aggregate out of 90
fprintf("Your university aggregate out of 90 is %0.2f\n", aggregateTotal);

% don't calc atar if aggregate too low, calculate atar otherwise
if aggregateTotal > 61.70
    [atar] = aggregateToAtar(aggregateTotal);
    fprintf("Based on 2021 data, your predicted ATAR is %0.2f\n", atar);
else 
    disp("Your ATAR is below 70. Have you considered TAFE?");
end
% adjust subject count
numberOf10Cred = uniExt + numberOf10Cred;
numberOf20Cred = conditionalVET + numberOf20Cred;
% disp sace results in graph
[Subjects] = plotSubjectScores(Subjects, Scores, atar, numberOf10Cred, numberOf20Cred);
