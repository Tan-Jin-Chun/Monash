% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: normal_pdf (Used in Lab3_Task4)

function prob_density = normal_pdf(x , mean , sd)
    % The inputs and the outputs of your function should be as follows:
    % Inputs - x : numpy array of linearly spaced points (N x 1)
    %        - mean : an integer value
    %        - sd: an integer value
    % Output - prob_density : a numpy array of probability densities
    
    prob_density = (1.0 / (np.sqrt(2 * np.pi) * sd)) * np.exp(-0.5 * ((x - mean) / sd)^2);