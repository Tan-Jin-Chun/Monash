function P = atmos_press(z)
% computing the atmospheric pressure for given altitude
P = 101.325*(1-0.02256*z).^5.256;