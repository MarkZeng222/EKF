function [mu_t, Sigma_t] = ekf(mu, Sigma, u, z)
%Extended Kalman Filter

 Rt = [(0.25)^2 0;0 (0.25)^2]; %control input's covariance
 Qt = [(0.25)^2 0;0 (0.25)^2]; %d1,d2's covariance
 
 %change name of variable
 mu_t_minus_1 = mu;
 Sigma_t_minus_1 = Sigma;
 ut = u;
 zt = z;
 
 %Prediction
 mu_t_bar = mu_t_minus_1 + ut; %MUt = Mut-1 + ut
 Gt = plant_jacobian(mu_t_minus_1);
 sigma_t_bar = Gt * Sigma_t_minus_1 * transpose(Gt) + Rt;
 
 %Correction
 Ht = meas_jacobian(mu_t_bar);
 Kt = sigma_t_bar * transpose(Ht) * (Ht * sigma_t_bar * transpose(Ht) + Qt)^-1;
 h_mu_t_bar = [sqrt((5 - mu_t_bar(1))^2+(mu_t_bar(2))^2);sqrt((10 - mu_t_bar(1))^2+(mu_t_bar(2))^2)]; % h(mu_t_bar)
 mu_t = mu_t_bar + Kt * (zt - h_mu_t_bar);
 KHt = Kt * Ht;
 Sigma_t = (eye(size(KHt)) - KHt) * sigma_t_bar;
 
   
end

