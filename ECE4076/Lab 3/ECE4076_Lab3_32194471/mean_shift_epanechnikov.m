function m = mean_shift_epanechnikov(X, m_init, bandwidth, max_iter)
    % Inputs - X : samples (i x 1 array), where i is the number of samples
    %        - m_init : initial mode
    %        - bandwidth : a scalar value representing "h" in the equation
    %        - max_iter : the maximum number of iterations
    % Output - m : the mode of the distribution

    if nargin < 3
        bandwidth = 0.1;
    end

    if nargin < 4
        max_iter = 100;
    end

    m = m_init;

    for iter = 1:max_iter
        K = epanechnikov_kernel(m, X, bandwidth);
        m_new = sum(K .* X) / sum(K);
        if abs(m_new - m) < 1e-6  % convergence check
            break
        end
        m = m_new;
    end
end
