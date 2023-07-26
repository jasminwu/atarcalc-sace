function [uniExt, headstartName, headstartGrade] = initialiseUni(uniExt)
%initialiseUni asks how many headstart / other university
%extension courses the user has done and converts letter grades into scaled
%scores

    % ensures input is valid
    while uniExt < 0 || uniExt > 4
            uniExt = input("Invalid input. How many university extension courses (e.g. Headstart) have you completed? ");
    end

    % initialises matrices for headstart
    headstartName = strings(uniExt, 1);
    headstartGrade = [];
    % enters headstart subject + grade
    if uniExt >= 1 
        for i = 1:uniExt
        headstartName(i, 1) = input("Enter the name of subject "+i+": ", "s");
        letterGrade = input("Enter the grade of subject "+i+", (HD, D, C, P, F): ", "s");
        % converts grade to scaled score, ignores F because they dont convert to a score 
            switch letterGrade
                case {"HD", "hd", "Hd"}
                    headstartGrade(i, 1) = 10;
                case {"D", "d"}
                    headstartGrade(i, 1) = 9.9;
                case {"C", "c"}
                    headstartGrade(i, 1) = 9;
                case {"P" "p"} 
                    headstartGrade(i, 1) = 7.9; 
                case {"F" "f"}
                    disp("Have you considered TAFE?");
                    headstartGrade(i, 1) = 0;
            end
        end
    end

end