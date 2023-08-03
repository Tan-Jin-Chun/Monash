% Written by Tan Jin Chun - 32194471
% Last Modified: 3/9/2021

clear all;close all;clc

%% Part 3
% Loading in the data
load('Assignment_Data.mat');

%% Part 4
% Given code
id = input('What is your ID number?');
rng(id);
K = 1200;
N = length(Data.ID);
i_n = randperm(N);
i_tr = Data.ID(i_n(1:K));
i_ts = Data.ID(i_n(K+1:end));
Train = Data(i_tr,:);
Test = Data(i_ts,:);

% Saving the Data
save('Train','Train');
save('Test','Test');

%% Part 5
fprintf("\n\nPart 5\n");
% Question 5.1
% This means we need to get the total number of patients that has a 0 in
% the Diagnosis column of the data and the total number of patients itself
% Loading the file 
load Train.mat

% Question 5.1
% Getting the total number of patients in the Train.mat file
Total_Patients = length(Train.ID);

% Getting the total number of patients that have a normal heartbeat
% Extracting the data (Getting the ID of the patient)
Normal_Patients = sum(Train.Diagnosis == 0);

% Probability of the subject being normal
% P(normal) = total number of subjects in normal condition / total patients
Prob_Normal = Normal_Patients / Total_Patients;

% Printing out the value
fprintf("The probability of the subject being normal is %f\n", Prob_Normal);

% Question 5.2
% The probability of the subject having AF(Atrial Fibrillation) disease is 
% just 1-Prob_Normal
% P(AF) = total number of subjects with AF condition / total patients
Prob_AF = 1- Prob_Normal;

% Printing out the value
fprintf("The probability of the subject having AF is %f\n", Prob_AF);

% Question 5.3
% Number of P_wave present
P_Wave = sum(Train.Pwave == 1);

% Probability of P_wave
% P(P-wave) = total number of subjects with P-wave / total patients
Prob_Pwave = P_Wave / Total_Patients;

% Printing out the value
fprintf("The probability of the subject having AF is %f\n", Prob_Pwave);

% Question 5.4
% Mean and Variance of SDRR for subjects in the train set
SDRR_mean = mean(Train.SDRR);
SDRR_var = var(Train.SDRR);

% Printing out the value
fprintf("The mean of SDRR is %f\n", SDRR_mean);
fprintf("The variance of SDRR is %f\n", SDRR_var);

% Question 5.5
% First Method
% Finding the range and then dividing it into 10 equal size intervals
% PDF Estimation for SDRR with 10 bins
% SDRR_x is the bin_values
[SDRR_x, SDRR_y] = find_PDF(Train.SDRR, 10);

% Alternate way for getting the probability of the SDRR value lying in each
% bin (A more direct way of doing it)
% Number of Bins required
Number_Bins = 10;

% First, we need to find the range of SDRR value, so we need to take the
% lower quartile (min) and the upper quartile (max) to get the range
Lower_Quartile = min(Train.SDRR);
Upper_Quartile = max(Train.SDRR);

% Dividing the range into 10 equally signed bins (11 edges)
Bin_Values = linspace(Lower_Quartile, Upper_Quartile, Number_Bins + 1);

% Preallocation for the probability to increase computational efficiency
Prob_SDRR = zeros(1, length(Bin_Values) - 1);

% Using a for loop
for i = 1:length(Prob_SDRR)
    
    % Probability of SDRR values lying within a specific range of bin (So the current bin value and the next bin value)
    Prob_SDRR(i) = length(Train.SDRR((Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)))) / length(Train.SDRR);
    
end

% Plotting the bar graph showing the probability of the SDRR value in each
% bin using the histogram function
figure;
histogram(Train.SDRR, Bin_Values, "Normalization", "probability");
xlabel("x (Bin Values)");
ylabel("Relative Frequency");
title("Probability of SDRR value In Each Bin");

%% Part 6
fprintf("\n\nPart 6\n")
% Conditional Probability 

% Question 6.1
% Getting the probability of the P-wave being present if the subject is not
% diagnosed with AF
% P(Pwave|Normal) = (Number of subjects that have P-wave AND Normal) / Number
% of Normal Subjects
P_wave_NAF = sum(Train.Pwave == 1 & Train.Diagnosis == 0) / sum(Train.Diagnosis == 0);

% Printing out the values
fprintf("The probability that the P-wave present given that the subject is not diagnose with AF is %f\n", P_wave_NAF);

% Question 6.2
% Getting the probability of the P-wave being present if the subject is
% diagnosed with AF
% P(Pwave|AF) = (Number of subjects that have P-wave AND have AF) / Number
% of Subjects with AF
P_wave_AF = sum(Train.Pwave == 1 & Train.Diagnosis == 1) / sum(Train.Diagnosis == 1);

% Printing out the values
fprintf("The probability that the P-wave present given that the subject is diagnosed with AF is %f\n", P_wave_AF);

% Question 6.3
% Getting the mean and variance of patients diagnosed with AF
mean_AF = mean(Train.SDRR(Train.Diagnosis == 1));
var_AF = var(Train.SDRR(Train.Diagnosis == 1));

% Printing out the values
fprintf("The mean and variance of SDRR for the patients diagnosed with AF is %f and %f\n", mean_AF, var_AF);

% Question 6.4
% Getting the mean and variance of SDRR patients with normal conditions
mean_NAF = mean(Train.SDRR(Train.Diagnosis == 0));
var_NAF = var(Train.SDRR(Train.Diagnosis == 0));

% Printing out the values
fprintf("The mean and variance of SDRR for the patients with normal conditions is %f and %f\n", mean_NAF, var_NAF);

% Question 6.5
% CPDF Estimation for SDRR given that the subject is Normal with 10 bins
% Preallocation
Prob_SDRR_Normal = zeros(1,length(Bin_Values)-1);

% Using a for loop
for i = 1:length(Prob_SDRR_Normal)
    
    % Probability of SDRR given that the subject is Normal
    % P(SDRR|Normal) = (SDRR value in a specific bin AND Normal) / Number
    % of Normal Subjects
    Prob_SDRR_Normal(i) = length(Train.SDRR((Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)) & (Train.Diagnosis == 0))) / length(Train.SDRR(Train.Diagnosis == 0));
    
end

% Plotting the graph
figure;
histogram(Train.SDRR(Train.Diagnosis == 0), Bin_Values, "Normalization", "probability");
xlabel("x (Bin Values)");
ylabel("Relative Frequency");
title("Conditional Probability of the SDRR value given that the subject is Normal");

% Question 6.6
% CPDF Estimation for SDRR given that the subject is diagnosed with AF with 10 bins
% Preallocation
Prob_SDRR_AF = zeros(1,length(Bin_Values)-1);

% Using a for loop
for i = 1:length(Prob_SDRR_AF)
    
    % Probability of SDRR given that the subject have AF
    % P(SDRR|AF) = (SDRR value in a specific bin AND have AF) / Number
    % of subjects with AF
    Prob_SDRR_AF(i) = length(Train.SDRR((Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)) & (Train.Diagnosis == 1)))/length(Train.SDRR(Train.Diagnosis == 1));
    
end

% Plotting the graph
figure;
histogram(Train.SDRR(Train.Diagnosis == 1), Bin_Values, "Normalization", "probability");
xlabel("x (Bin Values)");
ylabel("Relative Frequency");
title("Conditional Probability of the SDRR value given that the subject has AF");

% Another Method of doing the graphs
% Question 6.5
% CPDF Estimation for SDRR given that the subject is diagnosed with AF with 10 bins
% [SDRRNAF_x, SDRRNAF_y] = find_PDF(Train.SDRR(Train.Diagnosis == 0), 10);

% Question 6.6
% CPDF Estimation for SDRR given that the subject is diagnosed with AF with 10 bins
% [SDRRAF_x, SDRRAF_y] = find_PDF(Train(Train.Diagnosis == 1).SDRR, 10);

%% Part 7
fprintf("\n\nPart 7\n");
% Bayes Rule
% Question 7.1
% Probability of having a normal condition if no P-wave has been detected
% The values are taken from Q5,1 and Q5.3 and Q6.1
% P(Normal|No P-wave) = P(no P-wave|Normal) * P(Normal) / P(No P-wave)
Norm_NPwave = ((1-P_wave_NAF) * Prob_Normal) / (1-Prob_Pwave);

% Printing out the value
fprintf("The probability of having a Normal condition if no P-wave has been detected is %f\n", Norm_NPwave);

% Question 7.2
% Probability of having AF if no P-wave has been detected
% The values are taken from Q5,2 and Q5.3 and Q6.2
% P(AF|No P-wave) = P(no P-wave|AF) * P(AF) / P(No P-wave)
AF_NPwave = ((1-P_wave_AF) * Prob_AF) / (1-Prob_Pwave);

% Printing out the value
fprintf("The probability of having AF if no P-wave has been detected is %f\n", AF_NPwave);

% Question 7.3
% Probability of having a normal condition if P-wave has been detected
% The values are taken from Q5.1, Q5.3 and Q6.1
% P(Normal|P-wave) = P(P-wave|Normal) * P(Normal) / P(P-wave)
Prob_Norm_Pwave = (P_wave_NAF * Prob_Normal) / Prob_Pwave;

% Printing out the value
fprintf("The probability of having a Normal Condition if P-wave has been detected is %f\n", Prob_Norm_Pwave);

% Question 7.4
% Probability of having AF if P-wave has been detected
% The values are taken from Q5.2, Q5.3 and Q6.2
% P(AF|P-wave) = P(P-wave|AF) * P(AF) / P(P-wave)
Prob_Norm_Pwave = (P_wave_AF * Prob_AF) / Prob_Pwave;

% Printing out the value
fprintf("The probability of having AF if P-wave has been detected is %f\n", Prob_Norm_Pwave);
fprintf("\n");

% Question 7.5
% Optional (Ungraded)
% Verifying the answer by taking the direct values from the data
Verify_Prob_5_1 = sum(Train.Diagnosis == 0 & Train.Pwave == 0) / sum(Train.Pwave == 0);
Verify_Prob_5_2 = sum(Train.Diagnosis == 1 & Train.Pwave == 0) / sum(Train.Pwave == 0);
Verify_Prob_5_3 = sum(Train.Diagnosis == 0 & Train.Pwave == 1) / sum(Train.Pwave == 1);
Verify_Prob_5_4 = sum(Train.Diagnosis == 1 & Train.Pwave == 1) / sum(Train.Pwave == 1);

% Printing out the verified answer
fprintf("%f, %f, %f, %f\n", Verify_Prob_5_1, Verify_Prob_5_2, Verify_Prob_5_3, Verify_Prob_5_4);
fprintf("\n");

% Question 7.6
% Finding the accuracy, sensitivity and specificity when compared with the
% data in the Test set (Test.mat)

% Loading the test set
load Test.mat

% Compare between two values
% If the actual patient has no P-wave, use answer from Q7.1 and Q7.2
% This means that if the patient has no P-wave, the patient is likely to
% have AF based on our probability of our two values that we have
% calculated above as our probability of having AF if no P-wave has been
% detected is larger than the probability of having a Normal condition if
% no P-wave has been detected.

% If the actual patient has P-wave, use answer from Q7.3 and Q7.4
% This means that if the patients have Pwave, then the patient is likely to
% be normal. Based on the probability that we have calculated above, the
% probability of having a Normal condition if P-wave has been detected is
% larger than the probability of having AF if P-wave has been detected.

TP = sum(Test.Pwave == 0 & Test.Diagnosis == 1);
FP = sum(Test.Pwave == 0 & Test.Diagnosis == 0);
FN = sum(Test.Pwave == 1 & Test.Diagnosis == 1);
TN = sum(Test.Pwave == 1 & Test.Diagnosis == 0);

% Accuracy
Accuracy = ((TN+TP) / (TN+TP+FN+FP)) * 100;

% Sensitivity 
Sensitivity = ((TP) / (TP+FN)) * 100;

% Specificity
Specificity = ((TN) / (TN+FP)) * 100;

% Printing the values out
fprintf("The accuracy is %.2f%%\n", Accuracy);
fprintf("The sensitivity is %.2f%%\n", Sensitivity);
fprintf("The specificity is %.2f%%\n", Specificity);

%% Part 8
fprintf("\n\nPart 8\n");
% Question 8.1
% Using Bayes Theorum
% Probability of having a Normal condition when SDRR lies in each bin

% Preallocating the variable
Prob_Norm_SDRR = zeros(1, length(Bin_Values)-1);

% Using a for loop to streamline the process of getting the probability
for i = 1:length(Prob_Norm_SDRR)
    % Getting the probability using the values obtained from Q5,1,Q5.5 and
    % Q6.5
    % P(Normal|SDRR in Bin) = P(SDRR in Bin|Normal) * P(Normal) / P(SDRR in
    % Bin);
    Prob_Norm_SDRR(i) = (Prob_SDRR_Normal(i) * Prob_Normal) / Prob_SDRR(i);
    
    % Printing the answers out
    fprintf("The probability of the subject having a normal condition in %d-th bin is %f\n", i, Prob_Norm_SDRR(i));
end
fprintf("\n");

% Question 8.2
% Probability of having AF condition when SDRR lies in each bin

% Preallocating the variable
Prob_AF_SDRR = zeros(1, length(Bin_Values) - 1);

% Using a for loop to streamline the process of getting the probability for
% each of the bin
for i = 1:length(Prob_AF_SDRR)
    % Getting the probability using the values obtained from Q5,2,Q5.6 and
    % Q6.6
    % P(AF|SDRR in Bin) = P(SDRR in Bin|AF) * P(AF) / P(SDRR in Bin);
    Prob_AF_SDRR(i) = (Prob_SDRR_AF(i) * Prob_AF) / Prob_SDRR(i);
    
    % Printing the answers out
    fprintf("The probability of the subject having AF condition in %d-th bin is %f\n", i, Prob_AF_SDRR(i));
end
fprintf("\n");

% % Question 8.3
% % Optional (Ungraded)
% % Verifying the answer
% 
% % Preallocating the variable
% Verify_Prob_8_1 = zeros(1, length(Bin_Values) - 1);
% Verify_Prob_8_2 = zeros(1, length(Bin_Values) - 1); 
% 
% % Using a for loop 
% for i = 1:length(Verify_Prob_8_1)
%     Verify_Prob_8_1(i) = length(Train.ID(Train.Diagnosis == 0 & Train.SDRR >= Bin_Values(i) & Train.SDRR <= Bin_Values(i+1))) / length(Train.ID(Train.SDRR >= Bin_Values(i) & Train.SDRR <= Bin_Values(i+1)));
%     Verify_Prob_8_2(i) = length(Train.ID(Train.Diagnosis == 1 & Train.SDRR >= Bin_Values(i) & Train.SDRR <= Bin_Values(i+1))) / length(Train.ID(Train.SDRR >= Bin_Values(i) & Train.SDRR <= Bin_Values(i+1)));
% end
% 
% % Printing out the verified answer
% fprintf("%f, %f\n", Verify_8_1, Verify_Prob_8_2);

% Question 8.4
% Finding the accuracy, sensitivity and specificity when compared with the
% data in the Test set (Test.mat)

% Loading the test set
% load Test.mat

% Compare between two values obtained for the 10 bins
% use answer from Q8.1 and Q8.2 and compare the probability from bin 1 to
% 10
% Based on the each of the 10 bins answer, we can see that the probabiltiy
% of the patient having AF if the subject has a SDRR value in Bin 1 and 2
% is lesser than the probability that the patient has a Normal condition if
% the subject has a SDRR value in Bin 1 and 2. So , we can conclude that
% the patient will have AF if the subject has a bin value of at least 3 and
% above (until the max value of 10) and the patient will be Normal if the
% subject has a bin value of 1 and 2.

% Initialising the result
FN_SDRR = 0;
TN_SDRR = 0;
TP_SDRR = 0;
FP_SDRR = 0;

% Using a for loop to loop through each values and an if-else statement
for i = 1:length(Prob_Norm_SDRR)
    
    % If Prob_Norm_SDRR > Prob_AF_SDRR (Meaning if it predicted Normal), only
    % increment the FN and TN (after checking what is the actual diagnosis of the patient in the Test Set)
    if (Prob_Norm_SDRR(i) > Prob_AF_SDRR(i))
        FN_SDRR = FN_SDRR + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Diagnosis == 1);
        TN_SDRR = TN_SDRR + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Diagnosis == 0);  
    else
        % Else, increment the TP and FP
        TP_SDRR = TP_SDRR + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Diagnosis == 1);
        FP_SDRR = FP_SDRR + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Diagnosis == 0);
    end
end

% Based on prediction, there is 100% chance of having  if the value of
% % SDRR > bin10 upper bound, therefore
% TP_SDRR = TP_SDRR + sum(Test.Diagnosis(~(Test.SDRR) >= Bin_Values(1) & Test.SDRR <= Bin_Values(10+1)));

% Accuracy
Accuracy_SDRR = ((TN_SDRR + TP_SDRR) / (TN_SDRR + TP_SDRR + FN_SDRR + FP_SDRR)) * 100;

% Sensitivity 
Sensitivity_SDRR = ((TP_SDRR) / (TP_SDRR + FN_SDRR)) * 100;

% Specificity
Specificity_SDRR = ((TN_SDRR) / (TN_SDRR + FP_SDRR)) * 100;

% Printing the values out
fprintf("The accuracy is %.2f%%\n", Accuracy_SDRR);
fprintf("The sensitivity is %.2f%%\n", Sensitivity_SDRR);
fprintf("The specificity is %.2f%%\n", Specificity_SDRR);

%% Part 9
fprintf("\n\nPart 9\n");
% Bayes Rule
% Question 9.1
% Probability of having a Normal Condition given that P-wave is present and
% SDRR is in the corresponding bin

% The probability of P-wave present and the SDRR value in bin
% Formula gotten by applying Bayes Rule and Total Probability Theorum and
% also Conditional Independence
% P(P-wave,SDRR in Bin) = P(P-wave|Normal)*P(Normal)*P(SDRR in Bin|Normal)+
% P(P-wave|AF)*P(AF)*P(SDRR in Bin|AF)

% Preallocating the variable
Prob_Norm_Pwave_SDRR = zeros(1,length(Bin_Values) - 1);

% Using a for loop
for i = 1:length(Prob_Norm_Pwave_SDRR)
    % Getting the total probability given the condition provided 
    % Using the values obtained from Q5.1,Q5.2,Q6.1,Q6.2,Q6.5 and Q6.6
    Total_Prob = (P_wave_NAF * Prob_Normal * Prob_SDRR_Normal(i)) + (P_wave_AF * Prob_SDRR_AF(i) * Prob_AF);
    
    % Getting the conditional probability using Bayes Rule
    % P(Normal|No P-wave,bin) = P(P-wave|Normal)*P(Normal)*P(SDRR in
    % Bin|Normal) / P(P-wave, SDRR in Bin)
    Prob_Norm_Pwave_SDRR(i) = (P_wave_NAF * Prob_Normal * Prob_SDRR_Normal(i)) / (Total_Prob);
    
    % Printing out the values
    fprintf("The conditional probability of the subject is Normal given that P-wave is present and SDRR is in %d-th bin is %f\n", i, Prob_Norm_Pwave_SDRR(i));
end
fprintf("\n");

% Question 9.2
% Probability of having a Normal condition when P-wave is absent and SDRR
% is in the corresponding bin

% The probability of P-wave absent and the SDRR value in bin
% Formula gotten by applying Bayes Rule and Total Probability Theorum and
% also Conditional Independence
% P(No P-wave,SDRR in Bin) = P(No P-wave|Normal)*P(Normal)*P(SDRR in Bin|Normal)+
% P(No P-wave|AF)*P(AF)*P(SDRR in Bin|AF)

% Preallocating the variable
Prob_Norm_NPwave_SDRR = zeros(1,length(Bin_Values) - 1);

% Using a for loop
for i = 1:length(Prob_Norm_NPwave_SDRR)
    % Getting the total probability given the condition provided (Same as Q9.1)
    % Using the values obtained from Q5.1,Q5.2,Q6.1,Q6.2,Q6.5 and Q6.6
    Total_Prob = ((1-P_wave_NAF) * Prob_Normal * Prob_SDRR_Normal(i)) + ((1-P_wave_AF) * Prob_SDRR_AF(i) * Prob_AF);
    
    % Getting the conditional probability 
    % P(Normal|No P-wave,SDRR in bin) = P(No P-wave|Normal)*P(Normal)*P(SDRR in Bin|Normal) / P(No P-wave, SDRR in Bin)
    Prob_Norm_NPwave_SDRR(i) = ((1-P_wave_NAF) * Prob_Normal * Prob_SDRR_Normal(i))  / (Total_Prob);
    
    % Printing out the probability
    fprintf("The conditional probability of the subject is Normal given that P-wave is absent and SDRR is in %d-th bin is %f\n", i, Prob_Norm_NPwave_SDRR(i));
end
fprintf("\n");

% Question 9.3
% Probability of having AF when P-wave is absent and SDRR is in the
% corresponding bin
% Preallocating the varible
Prob_AF_Pwave_SDRR = zeros(1,length(Bin_Values) - 1);

% Using a for loop
for i = 1:length(Prob_Norm_NPwave_SDRR)
    % Getting the total probability given the condition provided (Same as Q9.1)
    % Using the values obtained from Q5.1,Q5.2,Q6.1,Q6.2,Q6.5 and Q6.6
    Total_Prob = (P_wave_NAF * Prob_Normal * Prob_SDRR_Normal(i)) + (P_wave_AF * Prob_SDRR_AF(i) * Prob_AF);
    
    % Getting the conditional probability
    % P(AF|P-wave, SDRR in Bin) = P(P-wave|AF)*P(AF)*P(SDRR in Bin|AF) / P(P-wave, SDRR in Bin)
    Prob_AF_Pwave_SDRR(i) = (P_wave_AF * Prob_SDRR_AF(i) * Prob_AF) / (Total_Prob);
    
    % Printing out the probability
    fprintf("The conditional probability of the subject is having AF given that P-wave is present and SDRR is in %d-th bin is %f\n", i, Prob_AF_Pwave_SDRR(i));
end
fprintf("\n");

% Question 9.4
% Probability of having AF when P-wave is present and SDRR is in the
% corresponding bin
% Preallocating the varible
Prob_AF_NPwave_SDRR = zeros(1,length(Bin_Values) - 1);

% Using a for loop
for i = 1:length(Prob_Norm_NPwave_SDRR)
    % Getting the total probability given the condition provided (Same as Q9.1)
    % Using the values obtained from Q5.1,Q5.2,Q6.1,Q6.2,Q6.5 and Q6.6
    Total_Prob = ((1-P_wave_NAF) * Prob_Normal * Prob_SDRR_Normal(i)) + ((1-P_wave_AF) * Prob_SDRR_AF(i) * Prob_AF);
    
    % Getting the conditional probability
    % P(AF|No P-wave, SDRR in Bin) = P(No P-wave|AF)*P(AF)*P(SDRR in Bin|AF) / P(No P-wave, SDRR in Bin)
    Prob_AF_NPwave_SDRR(i) = ((1-P_wave_AF) * Prob_SDRR_AF(i) * Prob_AF) / (Total_Prob);
    
    % Printing out the probability
    fprintf("The conditional probability of the subject having AF given that P-wave is absent and SDRR is in %d-th bin is %f\n", i, Prob_AF_NPwave_SDRR(i));
end
fprintf("\n");

% % Question 9.5
% % Optional (Ungraded)
% % Verifying the answer directly
% Verify_Prob_9_1 = zeros(1,length(Bin_Values) - 1);
% Verify_Prob_9_2 = zeros(1,length(Bin_Values) - 1);
% Verify_Prob_9_3 = zeros(1,length(Bin_Values) - 1);
% Verify_Prob_9_4 = zeros(1,length(Bin_Values) - 1);
% 
% % Using a for loop
% for i = 1:length(Verify_Prob_9_2)
%     
%     % Getting the direct probability for each question in section 9
%     Verify_Prob_9_1(i) = length(Train.ID(Train.Diagnosis == 0 & Train.Pwave == 1 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)))) / length(Train.ID(Train.Pwave == 1 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1))));
%     Verify_Prob_9_2(i) = length(Train.ID(Train.Diagnosis == 0 & Train.Pwave == 0 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)))) / length(Train.ID(Train.Pwave == 0 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1))));
%     Verify_Prob_9_3(i) = length(Train.ID(Train.Diagnosis == 1 & Train.Pwave == 1 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)))) / length(Train.ID(Train.Pwave == 1 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1))));
%     Verify_Prob_9_4(i) = length(Train.ID(Train.Diagnosis == 1 & Train.Pwave == 0 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1)))) / length(Train.ID(Train.Pwave == 0 & (Train.SDRR >= Bin_Values(i)) & (Train.SDRR <= Bin_Values(i+1))));
% end
% 
% % Printing out the verified answer
% fprintf("%f, %f, %f, %f\n", Verify_Prob_9_1, Verify_Prob_9_2, Verify_Prob_9_3, Verify_Prob_9_4);
% fprintf("\n");

% Question 9.6
% Finding the accuracy, sensitivity and specificity when compared with the
% data in the Test set (Test.mat)

% Loading the test set
% load Test.mat

% The values obtained in Question 9.1 until Question 9.4 will be used in
% order to calculate the accuracy, sensitivity and the specificity for part
% 9

% Based on the probabilities that we have obtained from above, we can
% conclude that if the P-wave is present, subjects with SDRR value of 6 and
% above has a higher chance of being diagnosed with AF, while subjects with
% SDRR value of 5 and below will have a Normal Condition. If the P-wave is
% absent, subjects with SDRR value of 2 and above will be diagnosed with AF
% and the subjects with SDRR value of 1 will have a Normal Condition.

% Initialising the variables
FN_3 = 0;
TN_3 = 0;
TP_3 = 0;
FP_3 = 0;

% Using a for loop to loop through each values and an if-else statement
for i = 1:length(Prob_Norm_Pwave_SDRR)
    
   % Comparing the values from Q9.1 and Q9.3
   if (Prob_Norm_Pwave_SDRR(i) > Prob_AF_Pwave_SDRR(i))
       FN_3 = FN_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 1 & Test.Diagnosis == 1);
       TN_3 = TN_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 1 & Test.Diagnosis == 0);
   else 
       TP_3 = TP_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 1 & Test.Diagnosis == 1);
       FP_3 = FP_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 1 & Test.Diagnosis == 0);
   end
   
   % Another if statement
   % Comparing the values from Q9.2 and Q9.4 for each of the bins
   if (Prob_Norm_NPwave_SDRR(i) > Prob_AF_NPwave_SDRR(i))
       FN_3 = FN_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 0 & Test.Diagnosis == 1);
       TN_3 = TN_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 0 & Test.Diagnosis == 0);
   else
       TP_3 = TP_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 0 & Test.Diagnosis == 1);
       FP_3 = FP_3 + sum(Test.SDRR >= Bin_Values(i) & Test.SDRR <= Bin_Values(i+1) & Test.Pwave == 0 & Test.Diagnosis == 0);
   end
end

% Accuracy
Accuracy_3 = ((TN_3 + TP_3) / (TN_3 + TP_3 + FN_3 + FP_3)) * 100;

% Sensitivity 
Sensitivity_3 = ((TP_3) / (TP_3 + FN_3)) * 100;

% Specificity
Specificity_3 = ((TN_3) / (TN_3 + FP_3)) * 100;

% Printing the values out
fprintf("The accuracy is %.2f%%\n", Accuracy_3);
fprintf("The sensitivity is %.2f%%\n", Sensitivity_3);
fprintf("The specificity is %.2f%%\n", Specificity_3);

%% Part 10
% fprintf("\n\nPart 10\n");
% Question 10.1
% The three models that we have created above to predict whether a patient
% has AF or not.
% The first model is the P-wave Prediction Model.
% The value of the accuracy , sensitivity and specificity are as follows:
% 86.68%, 79,19%, 92.08%

% The second model is the SDRR Prediction Model.
% The value of the accuracy , sensitivity and specificity are as follows:
% 77.48%, 91.33% , 67.50%

% The third model is the P-wave and SDRR Prediction Model
% The value of the accuracy , sensitivity and specificity are as follows:
% 90.07%, 86.71%, 92.50%

% From our result, we can observe that the accuracy and the specificity
% of our P-wave and SDRR Prediction Model is the highest among the three
% prediction model. The Prediction Model which has the highest sensitivity
% would be the second prediction model which is the SDRR Prediction Model.
% Based on the observation above, the P-wave and SDRR Prediction Model
% would be the best model in predicting the diagnosis of AF. This is
% because this prediction model has the highest accuracy and the
% specificity(True Negative Rate). It also has a high sensitivity
% (True Positive Rate) although the value of the sensitivity is not the highest.

% Question 10.2
% What I have learn from this assignment is that I have manage to connect
% the probability concepts that I have learnt in the lecture and tutorial
% such as Bayes Theorum and apply them to practical real world data and come 
% up with meaningful results. 
% Besides that, I have also increase my knowledge in utilising MATLAB to 
% interact with data in order to solve a problem by coming up with a conclusion.

% Question 10.3
% Optional - Ungraded
% In my opinion, the proposed model suits the real-world scenarios. The
% prediction model that has been created above is versatile, meaning that
% the prediction model above has already accounted for the probability of a
% subject being Normal or having AF. If the data changes, it is still very
% likely to give a correct or accurate estimation of whether the patient
% has AF or not.

% Question 10.4
% Optional - Ungraded
% First, we need to know the formula for the Gaussian PDF model, which is
% given in the lecture notes. (fx(x) =(1/(2*pi*sigma))*exp(-((x-m)^2))/(2*sigma^2)),
% m is the mean, sigma is the standard deviation.
% Hence, from here , we only need to subsitute the value that we have found
% in part 6.
% The formula would be (fx(x) =(1/(2*pi*sigma))*exp(-((x-m)^2))/(2*sigma^2))

% Question 10.5
% Optional - Ungraded