clc;
clear all;
%% C-rate discharge
x=[-2 -1 -0.5 0 ];
v=[1.5 1.2 0 0 ];
C_rate=-3:0.5:0;
%eta_c = interp1(x,v,C_rate,'linear','extrap');
eta_c = griddedInterpolant(x,v,'linear','pchip');
%eta_c = griddedInterpolant(x,v,'linear','linear');
%eta_c = griddedInterpolant(x,v,'linear','cubic');
vq=eta_c(C_rate);
figure(1)
plot(x,v,'-o',C_rate,vq,'-b*');
set(gca,'FontSize', 12,'FontName','Times')
xlabel('C-rate','Interpreter', 'latex')
ylabel('$\eta_c$','Interpreter', 'latex')
grid on
%%
% Use a constant number of cycles with a constant DOD. Then compute
% capacity loss and plot it against the C-rate change. 
DOD=0.8;
cycles=2439;
Cap=2.2;
Ah=cycles*DOD*Cap;
% 0.5C-10.2721 2C-10.7778 6C-21.4006 10C-63.3336
%B=31630;
%B=21681;
%B=12934; 
B=11500;
Crate=10;
R=8.314;
T=273.15+25;
ex=exp((-28000+(370.2*Crate))/(R*T));
Qloss=B*ex*Ah^0.55;
%%
figure(2)
Q=[10.2721 10.7778 21.4006 63.3336];
C=[0.5 2 6 10];
val=[0.5,0.8,2,2.5,3,4,5,6,6.25,7,8,9,10];
Ql= griddedInterpolant(C,Q,'pchip');
vq1=Ql(val);
plot(C,Q,'--or',val,vq1,'-b*')
set(gca,'FontSize', 12,'FontName','Times')
xlabel('C-rate','Interpreter', 'latex')
ylabel('Capacity Loss (Ah)','Interpreter', 'latex')
legend('Capcity Loss','Interpolated Capacity Loss')
grid on
%% LiFePo4 Battery
V_nom=3.2; % Volts
I_dis=2; % discharge current
I_max=46;
I_c=[1 1.6 2 4 5 6 8 10 12.5 14 16 18 20]; % Current at Different C rates
C1=[0.5 1 1.5 2 2.5 3 4 5 6 7 8 9 10];
P_B=V_nom*I_c;
figure(3)
plot(I_c,vq1,'-*','Linewidth',1,'MarkerSize',10,...
    'MarkerEdgeColor','b')
set(gca,'FontSize', 12,'FontName','Times')
xlabel('Current(A)','Interpreter', 'latex')
ylabel('Capacity loss (Ah)','Interpreter', 'latex')
grid on
b=[2.5 3.4 4.4 5.7 7.8 8.9 14.5 15.9 16  17 19 ];
l=5;
