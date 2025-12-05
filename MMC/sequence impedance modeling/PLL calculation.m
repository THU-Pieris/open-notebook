syms V1 Vp f1 fp phi_p t real
syms theta_hat(t)            % this is \hat{\theta}(t)
syms theta(t)

%% Rotating dq-frame angle with perturbation
theta(t) = 2*pi*f1*t + theta_hat(t);

%% Phase voltages
va(t) = V1*cos(2*pi*f1*t) + Vp*cos(2*pi*fp*t + phi_p);

vb(t) = V1*cos(2*pi*f1*t - 2*pi/3) + ...
        Vp*cos(2*pi*fp*t + phi_p - 2*pi/3);

vc(t) = V1*cos(2*pi*f1*t - 4*pi/3) + ...
        Vp*cos(2*pi*fp*t + phi_p - 4*pi/3);

%% abc -> dq transform
k = sqrt(2/3);

xd(t) = k*( cos(theta(t))*va(t) + ...
           cos(theta(t) - 2*pi/3)*vb(t) + ...
           cos(theta(t) + 2*pi/3)*vc(t) );

xq(t) = k*( -sin(theta(t))*va(t) + ...
           -sin(theta(t) - 2*pi/3)*vb(t) + ...
           -sin(theta(t) + 2*pi/3)*vc(t) );

xd_simplified = simplify(xd)
xq_simplified = simplify(xq)
