e=1;    % Number of energy requirements
rt=1;
while(rt<=5)
e=1;
for z=1:1
clear xa u x xbar xa1 k rho mean_x0 s r v;
%% Time variables
T=24;   % Number of time slot 
del_t=1;    % Interval of an hour
t=1:del_t:T;    % Time Horizon

N_EV=40;    % Number of EV's (Agents) 
N=N_EV+1;   % Coordinator is the Final agent (Total number of agents)

% Global Constants
rho=0.001;  % penalty factor
alpha= 0.017;   % Depricaiation parameter Euro/kWh^2
gamma=1;    % Trade off parameter
ep=1;   % Primal threshold
ed=1;   % Dual threshold
E_bat=50;   % Battery Capacity
eta_ch=0.91;    % Efficiency of charger
c=1;    % Number of times connected to grid
m=2;    % m=1(Same) or (m=2) Different driving profiles


%% Energy Requirement
%E_req= randi([1,250],40,100);
%E_req= randi([1,40],40,2);
%E_req1=randi([1,20],40,1);
%E_req2=randi([1,20],40,1);
load Ereq;
 %load Ereq2;
%load Ereqf;
%load Ereq16.mat;  %Energy requirement c=1
%load Ereq16-1.mat; %Energy requirement1 c=2
%load Ereq16-2.mat; %Energy requirement2 c=2
%% Inital Charging Profile
 % Standard Charger for all EV
% for i=1:N_EV
%     idx=5;    % Charger Power
%     for j=1:T
%             x(i,j)=idx;   % Power drawn by each car for each time slot
%     end
% end

%Variable Charger Allocation
for i=1:N_EV
    for j=1:T
        if(E_req(i)<=36)
            x(i,j)=5; % 5kW charger
        else
            if((E_req(i)>36) && (E_req(i)<128))
                x(i,j)=16; % 16kW charger
            else
                if((E_req (i)> 128) && (E_req(i)<200))
                    x(i,j)=25; %25kW charger
                else
                    if( (E_req(i)>200) && (E_req(i)<320))
                        x(i,j)=40; % 40kW charger
                    end
                end
            end 
        end
    end
end
%x=profile(e,N_EV,E_req1,E_req2);


                             


x=x'; % Dimension 24x40

for i=1:T
    xa(:,i)=sum(x(i,:));    %Aggregated EV Power per time slot
end
xa=xa'; % Dimension 24x1

%% Lagrangian Price vectors

y1=[0.4,0.35,0.22,0.50,0.70,0.34,0.21,0.45,0.40,0.89,0.2,0.35,0.15,0.10,...
   0.55,0.60,0.43,0.75,0.65,0.90,0.54,0.85,0.80,0.45]'; % Dimension 24x1
y2=[ 0.45,0.4,0.35,0.10,0.50,0.43,0.34,0.21,0.40,0.55,0.35,0.15,0.22,...
 0.2,0.60,0.70,0.75,0.65,0.90,0.54,0.85,0.89, 0.80,0.45]';    
 y3=[0.4,0.60,0.22,0.50,0.45,0.34,0.55,0.45,0.40,0.89,0.2,0.85,0.15,0.80,...
 0.21,0.35,0.43,0.75,0.65,0.90,0.54,0.35,0.10,0.70]';   
 y4=[0.90,0.60,0.22,0.21,0.45,0.34,0.55,0.45,0.40,0.4,0.2,0.70,0.15,0.80,...
 0.50,0.35,0.43,0.75,0.54,0.89,0.65,0.35,0.10,0.85]'; 
 y5=[0.35,0.45,0.22,0.50,0.15,0.34,0.55,0.60,0.40,0.89,0.70,0.85,0.45,0.80,...
 0.21,0.35,0.43,0.75,0.65,0.90,0.54,0.4,0.10,0.2]'; 
 y=[y1 y2 y3 y4 y5];

u=y(:,rt)/rho;    % Scaled Price vector 24x1    

for i=1:T
    mean_x0(i,1)=sum(x(i,:))/N; % Sum of power for a time slot
end

xbar=(xa/N)+mean_x0; % Compute mean 
%% Aggregator Constraints
% p2=rand(24,4);
 p1=[0.4,0.35,0.22,0.50,0.70,0.34,0.21,0.45,0.40,0.89,0.2,0.35,0.15,0.10,...
 0.55,0.60,0.43,0.75,0.65,0.90,0.54,0.85,0.80,0.45]';    % Electricity price
 p2=[ 0.45,0.4,0.35,0.10,0.50,0.43,0.34,0.21,0.40,0.55,0.35,0.15,0.22,...
 0.2,0.60,0.70,0.75,0.65,0.90,0.54,0.85,0.89, 0.80,0.45]';    
 p3=[0.4,0.60,0.22,0.50,0.45,0.34,0.55,0.45,0.40,0.89,0.2,0.85,0.15,0.80,...
 0.21,0.35,0.43,0.75,0.65,0.90,0.54,0.35,0.10,0.70]';   
 p4=[0.90,0.60,0.22,0.21,0.45,0.34,0.55,0.45,0.40,0.4,0.2,0.70,0.15,0.80,...
 0.50,0.35,0.43,0.75,0.54,0.89,0.65,0.35,0.10,0.85]'; 
 p5=[0.35,0.45,0.22,0.50,0.15,0.34,0.55,0.60,0.40,0.89,0.70,0.85,0.45,0.80,...
 0.21,0.35,0.43,0.75,0.65,0.90,0.54,0.4,0.10,0.2]'; 
 p=[p1 p2 p3 p4 p5];
%load price
xa_lbar=ones(1,T)*0;    % Maximal profile fed back to grid
xa_hbar=ones(1,T)*600;  % Maximum aggregated demand profile.
%% Driving Profile
if(c==1 && m==1)
    d1=[ones(1,4) zeros(1,16) ones(1,4)];
    d=zeros(24,40);
    for i=1:N_EV
        d(:,i)=d1;
    end
else
    if(c==1 && m==2)
        d1=[ones(1,2) zeros(1,16) ones(1,6)]';
        d2=[ones(1,6) zeros(1,16) ones(1,2)]';
        d3=[ones(1,4) zeros(1,16) ones(1,4)]';
        d4=[zeros(1,16) ones(1,8)]';
        dbar=[d1 d2 d3 d4];
        t1=1;
        d=zeros(24,40);
        for i=1:N_EV
            if(t1==5)
            t1=1;
            end
            d(:,i)=dbar(:,t1);
            t1=t1+1;
        end
    else
        if(c==2 && m==1)
            d1=[1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0];
            d=zeros(24,40);
            for i=1:N_EV
                d(:,i)=d1;
            end
        else
            if(c==2 && m==2)
                d1=[1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0]';  
                d2=[0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1]';
                d3=[0 0 0 0 1 1 1 1 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0]';
                d4=[0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 1 1 1 1 0 0]';
                dbar=[d1 d2 d3 d4];
                t1=1;
                d=zeros(24,40);
                for i=1:N_EV
                    if(t1==5)
                        t1=1;
                    end
                    d(:,i)=dbar(:,t1);
                    t1=t1+1;
                end
            end
        end
    end
end

%% ADMM Algorithm
if(c==1 && ((m==1)||(m==2)))
    [x_lbar,x_hbar]=constraint1(N_EV,d,x); % Constraint 1
    [A, R_lbar, R_hbar]= constraint2sd(e,m,E_req,eta_ch,del_t); % Constraint 2
    [B, S_lbar, S_hbar]= constraint3sd(e,m,E_req,E_bat,eta_ch,del_t); % Constraint 3
else
    if(c==2 && ((m==1)||(m==2))) 
        [x_lbar,x_hbar]=constraint1(N_EV,d,x); % Constraint 1
        %[A, R_lbar, R_hbar]= constraint2(e,m,E_req1,E_req2,eta_ch,del_t); % Greedy Charging
        [A, R_lbar, R_hbar]= constraint2me(e,m,E_req1,E_req2,E_bat,eta_ch,del_t); % Minimal Energy
        [B, S_lbar, S_hbar]= constraint3(e,m,E_req1,E_req2,E_bat,eta_ch,del_t); % Constraint 3
    end
end


k=1;    % Iteration Counter
maxiter=200;   % Max Iterations

options=optimoptions('fmincon','Algorithm','sqp','Display','off');

% EV Cost function
fi=@(gamma,alpha,xev,x0,xbar,u,rho) gamma*alpha*(norm(xev))^2+0.5*rho*(norm(xev-x+xbar+u))^2;

% EVA Cost function
fa=@(p,xa1,del_t,xa,xbar,u,rho) (-p'*xa1*del_t)+0.5*rho*(norm(xa1-xa+xbar+u))^2;
 
xa1=xa;

t_start = tic;  % Time algorithm
while ~(k>=maxiter)
    i1=1;i2=1;
    % Optimize Individual EV Problems
    for i=1:N_EV
        if(c==1 && ((m==1)||(m==2)))
            A_in=[-A(i1,:); A(i1,:); -B([i2:i2+7],:); B([i2:i2+7],:)];
            b_in=[-R_lbar(i1); R_hbar(i1); -S_lbar([i2:i2+7]);S_hbar([i2:i2+7])];
            x(:,i,k+1)=fmincon(@(xev)fi(gamma,alpha,xev,x(:,i,k),xbar(:,k),u(:,k),rho(:,k))...
                  ,x(:,i,k),A_in,b_in,[],[],x_lbar(:,i),x_hbar(:,i),[],options);
              i1=i1+1;
              i2=i2+8;
        else
            if(c==2 && ((m==1)||(m==2)))
                A_in=[-A([i1:i1+1],:); A([i1:i1+1],:); -B([i2:i2+7],:); B([i2:i2+7],:)];
                b_in=[-R_lbar([i1:i1+1]);R_hbar([i1:i1+1]);-S_lbar([i2:i2+7]);S_hbar([i2:i2+7])];
                x(:,i,k+1)=fmincon(@(xev)fi(gamma,alpha,xev,x(:,i,k),xbar(:,k),u(:,k),rho(:,k))...
                  ,x(:,i,k),A_in,b_in,[],[],x_lbar(:,i),x_hbar(:,i),[],options);
              i1=i1+2;
              i2=i2+8;
            end
        end
    end
    
    % Aggregated Power of all EV for 24h
    for i=1:T
     xa(i,k+1)=sum(x(i,:,k+1)); 
    end
    
    % EVA Optimisation problem
    xa1(:,k+1)=fmincon(@(x1) fa(p(:,rt),x1,del_t,xa1(:,k),xbar(:,k),u(:,k),rho(:,k))...
        ,xa(:,k),[],[],[],[],-xa_hbar,-xa_lbar,[],options);
    
    % Aggregated Response of EV's
    for i=1:T
        mean_x0(i,k+1)=sum(x(i,:,k+1))/N;
    end
    
    % Power variable update
    xbar(:,k+1)=(xa1(:,k+1)/N)+mean_x0(:,k+1);
  
    % Price Update
    u(:,k+1)=u(:,k)+xbar(:,k+1);
    
    % Convergence Computation
    if(k==1)
       r(:,k)=xbar(:,k);
       x0_s=[x(:,:,k) xa1(:,k)];
       xp=[zeros(24,41)];
       for i=1:N
           s(:,i,k)=-rho(:,k)*N*(x0_s(:,i)-xp(:,i)+(zeros(24,1)-xbar(:,k)));
       end
    else
        r(:,k)=xbar(:,k);
        x0_s=[x(:,:,k) xa1(:,k)];
        xp=[x(:,:,k-1) xa1(:,k-1)];
        for i=1:N
            s(:,i,k)=-rho(:,k)*N*(x0_s(:,i)-xp(:,i)+(xbar(:,k-1)-xbar(:,k)));
        end
    end
    
    % Update Penalty Factor
    lam1=0.001;
    lam2=0.01;
    if(k==1)
        v(k)=rho(:,k)*norm(r(:,k))/norm(s(:,:,k),'fro');
        rho(:,k+1)=rho(:,k)*exp(lam1*v(k)+lam2*(v(k)));
        u(:,k+1)=(rho(:,k)/rho(:,k+1))*u(:,k+1);
    else
        v(k)=rho(:,k)*norm(r(:,k))/norm(s(:,:,k),'fro');
        v(k-1)=rho(:,k-1)*norm(r(:,k-1))/norm(s(:,:,k-1));
        rho(:,k+1)=rho(:,k)*exp(lam1*v(k)+lam2*(v(k)-v(k-1)));
        u(:,k+1)=(rho(:,k)/rho(:,k+1))*u(:,k+1);
    end
    
    % Check for condition
    if(norm(r(:,k),2)<=ep && norm(s(:,:,k),'fro')<=ed)
        break;
    end
    
    % Update iteration
    k=k+1;
    % Display the iteration Number
    disp(k)
end

tEnd = toc(t_start);   % End Time

E_tot=E_req(:,z); % Energy Requirement
EV_no=1:40;
for i=1:N_EV
    Energy_EVvam(z,i,rt)=sum(x(:,i,k)); % Energy per EV
end
for i=1:N_EV
    Cost_EVT(:,i,rt)=alpha*(x(:,i,k)).^2; % Degradation at each time slot
end
for i=1:N_EV
    Cost_EVvam(i,z,rt)=sum(Cost_EVT(:,i,z));    % Degradation of each EV
end
degradationvam(:,rt)=sum(Cost_EVvam(:,z,rt)); % Total Degradation of fleet
Overallcostvam(:,rt)=p(:,rt)'*abs(xa1(:,k))*del_t+gamma*degradationvam(:,rt);
aggcostvam(:,rt)=p(:,rt)'*abs(xa1(:,k))*del_t;
xaovam(:,rt)=xa1(:,k);
e=e+1;
end
rt=rt+1;
disp(rt)
end

% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\Energy_EVvam.mat','Energy_EVvam');
% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\Cost_EVvam.mat','Cost_EVvam');
% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\degradationvam.mat','degradationvam');
% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\Overallcostvam.mat','Overallcostvam');
% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\xaovam.mat','xaovam');
% save('D:\One Drive\OneDrive - Delft University of Technology\Desktop\Final Plots\Electricity change\Night charging\aggcostvam.mat','aggcostvam');