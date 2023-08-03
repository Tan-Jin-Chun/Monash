function [finalmark, grade]=markscalc(lab,assignment,other,exam)
% Written by: Tony Vo, Modified by: Soon FOo Chong
% lab marks are 25% (25/200 = x0.125)
% assignment mark is 10% (10/10 = x1)
% other mark is 15% (15/15 = x1)
% exam mark is 50% (50/100 = x0.5)
final_lab_marks=sum(lab)*0.125;
final_exam_mark = exam*0.5;
finalmark = round(final_lab_marks + assignment + other + final_exam_mark) ;

% letter grades
if finalmark >=80
grade = "HD";
elseif finalmark >= 70
grade = "D";
elseif finalmark >= 60
grade = "C";
elseif finalmark >= 50
grade = "P";
else
grade = 'N';
end