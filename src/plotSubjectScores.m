function [Subjects] = plotSubjectScores(Subjects, Scores, atar, numberOf10Credits, numberOf20Credits)
%plotSubjectScores draws bar graph of subject scores. 

% change from n x 1 matrix to 1 x n matrix (transpose)
% https://au.mathworks.com/matlabcentral/answers/214645-converting-a-horizontal-matrix-to-vertical
Subjects = Subjects.'; 
Scores = Scores.';

% turn scores into percentages
Scores = rawToPercent(Scores, numberOf10Credits, numberOf20Credits);
% convert to char array for graphing
Subjects = convertStringsToChars(Subjects);

% generate random colours for graph
colour = randColour(length(Scores));

% bar graph
% https://au.mathworks.com/matlabcentral/answers/57984-how-can-i-make-a-bar-graph-using-a-cell-array-of-strings
b = bar(Scores);
b.FaceColor = 'flat';

% generate random colours
for i = 1:length(Scores)
    b.CData(i,:) = [colour(i) colour(i+1) colour(i+2)];
end

set(gca,'XtickLabel',Subjects);
ylim([50 100])
xlabel('Subjects')
ylabel('Relative Performance (%)');
title("Comparing Performance Across Subjects: "+ atar + " ATAR")

text(1:length(Scores),Scores,num2str(Scores'),'vert','bottom','horiz','center'); 
box off

end

