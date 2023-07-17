function [atar] = aggregateToAtar(aggregateTotal)
    % round to 2dp in increments of 0.05
    aggregateTotal = (round((aggregateTotal * 100)/5) * 5) / 100;

    % import spreadsheet
    conversionTable = readmatrix('saceData.xlsx');
    
    left = 1;
    right = size(conversionTable, 1);
    matchFound = false;
    
    while left <= right && ~matchFound
        mid = floor((left + right) / 2);
        
        if aggregateTotal == conversionTable(mid, 1)
            atar = conversionTable(mid, 2);
            matchFound = true;
        elseif aggregateTotal < conversionTable(mid, 1)
            right = mid - 1;
        else
            left = mid + 1;
        end
    end
    
    if ~matchFound
        atar = NaN; % Match not found, set atar to NaN (or any other appropriate value)
    end
end

