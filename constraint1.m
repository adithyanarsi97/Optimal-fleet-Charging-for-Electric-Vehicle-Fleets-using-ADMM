function [x_lbar, x_hbar]= constraint1(N_EV,d,x)

for i=1:N_EV
    xmin(:,i)=0;
end
% Lower Bounds
x_lbar=d.*xmin;

for i=1:N_EV
    xmax(:,i)=x(:,i);
    %xmax(:,i)=5;
end

% Upper Bounds
x_hbar=d.*xmax;

end
