function [] = userSummary(Subjects,Scores)  
    % print asterisks to make the command window look nice
    % separates user input from output clearly
    fprintf("\n");
    for i = 1:10
        fprintf("*")
    end
    fprintf("\n");
    fprintf("\n"); 
    % display results in a table and show user
    overview = table(Subjects, Scores);
    disp(overview);
end