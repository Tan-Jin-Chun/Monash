% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: gmm_pdf (Used in Lab3_Task4)

function gmm_pdf = gmm_pdf(x, weights, means, sds)
    % x: input array
    % weights: vector of mixture weights
    % means: vector of mixture means
    % sds: vector of mixture standard deviations

    n_mixtures = length(weights);
    gmm_pdf = zeros(size(x));
    
    for i = 1:n_mixtures
        gmm_pdf = gmm_pdf + weights(i) * normpdf(x, means(i), sds(i));
    end
end
