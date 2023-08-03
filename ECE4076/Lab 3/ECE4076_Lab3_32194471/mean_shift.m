% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: mean_shift.m (Used in Lab3_Task5)

function m = mean_shift(X, m_init, bandwidth, max_iter)
    % Inputs:
    % X - a column vector (i x 1) representing the samples, where i is the number of samples
    % m_init - an initial guess for the mode
    % bandwidth - a scalar representing the bandwidth "h" in the kernel equation. This is optional and defaults to 0.1 if not provided.
    % max_iter - the maximum number of iterations for the mean shift algorithm. This is optional and defaults to 100 if not provided.
    
    % Output:
    % m - the mode of the distribution found by the mean shift algorithm
    
    % Check if bandwidth was provided, if not, set a default value
    if nargin < 3
        bandwidth = 0.1;
    end
    
    % Check if max_iter was provided, if not, set a default value
    if nargin < 4
        max_iter = 100;
    end
    
    m = m_init;
    
    for i = 1:max_iter
        K = flat_kernel(m, X, bandwidth);
        m_new = sum(K .* X) / sum(K);
        if abs(m_new - m) < 1e-6  % convergence check
            break
        end
        m = m_new;
    end
end

% To generate samples from the GMM in MATLAB, you may need additional functions 
% (e.g., makedist to create a Gaussian mixture distribution and random to generate random samples). 
% The exact code will depend on the specifics of your GMM (i.e., the means, standard deviations, and weights of the Gaussians).
