goal = [15; -2];

% change x0 for the two estimates of the starting position
x0 = [0; -5];
%x0 = [0; 9];


S0 = diag([1 1]);
Q = diag([1/16 1/16]);
R = diag([1/16 1/16]);
m1 = [5; 0];
m2 = [10; 0];

xtrue = [0; 5];

distance = norm(goal - x0);
xEst = x0;
PEst = eye(2);
u = [0; 0];
z = [norm(m1 - xtrue); norm(m2 - xtrue)] + mvnrnd([0 0], R).';
plot(xEst(1), xEst(2), 'o');
hold on
for t = 1:25
    [xEst,PEst] = ekf(xEst, PEst, u, z);
    plot(xEst(1), xEst(2), 'bo');
    u = goal - xEst;
    u = u / norm(u) + mvnrnd([0 0], Q).';
    xtrue = xtrue + u;
    plot(xtrue(1), xtrue(2), 'r*');
    z = [norm(m1 - xtrue); norm(m2 - xtrue)] + mvnrnd([0 0], R).';
end