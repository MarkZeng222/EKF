function [H] = meas_jacobian(xt)
%h1 = sqrt((5 - xt)^2 + yt^2);
%h2 = sqrt((10 - xt)^2 + yt^2);
yt = xt(2);
xt = xt(1);


d_h1_xt = (2*xt - 10)/(2*((xt - 5)^2 + yt^2)^(1/2));
d_h1_yt = yt/((xt - 5)^2 + yt^2)^(1/2);



d_h2_xt = (2*xt - 20)/(2*((xt - 10)^2 + yt^2)^(1/2));
d_h2_yt = yt/((xt - 10)^2 + yt^2)^(1/2);

H = [d_h1_xt d_h1_yt; d_h2_xt d_h2_yt];

end

