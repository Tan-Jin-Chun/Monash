% Written by: Tony Vo, Mofified by: Soon Foo Chong
clear all; close all; clc;

% Reads in student marks. Prompts user to enter an ID as
% input, finds the index and return corresponding student's final mark.

% import data from text file
values = importdata('ENG1060studentmarks2.txt');
% generate vectors containing values from each column
ID = values.data(:,1);
labs = values.data(:,2:11);
assignment = values.data(:,12);
other = values.data(:,13);
exam = values.data(:,14);

% the student's ID entered by the user.
id_input = input ('Please enter student ID: ');

% determining the row of the ID input
row= find(ID==id_input)%(ID==id_input); % creating a logical

% calculating final mark
labmarks = labs(row,:) % Labs is a 2D matrix, so only row index
assignmentmarks = assignment(row)
othermarks = other(row)
exammarks = exam(row)
[finalmark,grade] = markscalc(labmarks,assignmentmarks,othermarks,exammarks);
fprintf ('Student with ID number %s obtained a final mark of %g corresponding to a %s grade \n', num2str(id_input),finalmark,grade);