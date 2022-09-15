function [atar] = aggregateToAtar(aggregateTotal)
    % round to 2dp in increments of 0.05
    aggregateTotal = (round((aggregateTotal * 100)/5) * 5) / 100;

    % import spreadsheet
    conversionTable = readmatrix('saceData.xlsx');
    matchFound = false;

    index = 1;
    while ~matchFound
        if aggregateTotal == conversionTable(index, 1)
            atar = conversionTable(index, 2);
            matchFound = true;
        else 
            index = index + 1;
        end
    end
end
