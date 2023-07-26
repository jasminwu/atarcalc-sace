function [conditionalVET, VET, vetScore] = initialiseVetCourse(vetCourse)
%initialiseVetCourse this function checks whether user has done a vet course
%that is eligible to count towards the atar

    % ensures input is valid
    while vetCourse ~= "Y" && vetCourse ~= "N" && vetCourse ~= "y" && vetCourse ~= "n"
       vetCourse = input("Have you completed a VET course that is Cert III or above? Enter 'Y' or 'N'. ", "s");
    end
    % sets boolean and initalises arrays for later concantenation
    switch vetCourse
        case {"Y", "y"}
            conditionalVET = true;
            VET = ["VET Course"];
            vetScore = [];
        case {"N", "n"}
            conditionalVET = false;
            VET = [];
            vetScore = [];
    end

end