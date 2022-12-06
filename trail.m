e=1;    % Number of energy requirements
for z=1:1
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
c=2;    % Number of times connected to grid
m=2;    % m=1(Same) or (m=2) Different driving profiles

%% Inital Charging Profile
x=zeros(40,24);
for i=1:N_EV
    for j=1:24
        if(rem(i,4)==1)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:14])=5;
                    x(i,[15:24])=16;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:14])=5;
                        x(i,[15:24])=25;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                            x(i,[1:14])=5;
                            x(i,[15:24])=40;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:14])=16;
                                x(i,[15:24])=5;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:14])=16;
                                        x(i,[15:24])=25;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:14])=16;
                                           x(i,[15:24])=40;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:14])=25;
                                              x(i,[15:24])=5;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:14])=25;
                                                  x(i,[15:24])=16;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:14])=25;
                                                          x(i,[15:24])=40;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:14])=40;
                                                              x(i,[15:24])=5;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160 ) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:14])=40;
                                                                   x(i,[15:24])=16;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 &&E_req2(i,e)<=100))
                                                                       x(i,[1:14])=40;
                                                                       x(i,[15:24])=25;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==2)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:6])=5;
                    x(i,[7:20])=16;
                    x(i,[21:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:6])=5;
                        x(i,[7:20])=25;
                        x(i,[21:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                            x(i,[1:6])=5;
                            x(i,[7:20])=40;
                            x(i,[21:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:6])=16;
                                x(i,[7:20])=5;
                                x(i,[21:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<64) && (E_req2(i,e)>20 && E_req2(i,e)<64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:6])=16;
                                        x(i,[7:20])=25;
                                        x(i,[21:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:6])=16;
                                           x(i,[7:20])=40;
                                           x(i,[21:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:6])=25;
                                              x(i,[7:20])=5;
                                              x(i,[21:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:6])=25;
                                                  x(i,[7:20])=16;
                                                  x(i,[21:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:6])=25;
                                                          x(i,[7:20])=40;
                                                          x(i,[21:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:6])=40;
                                                              x(i,[7:20])=5;
                                                              x(i,[21:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:6])=40;
                                                                   x(i,[7:20])=16;
                                                                   x(i,[21:24])=40;
                                                               else
                                                                   if((E_req1(i,e)> 100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:6])=40;
                                                                       x(i,[7:20])=25;
                                                                       x(i,[21:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 &&E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==3)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                    x(i,[1:4])=5;
                    x(i,[5:10])=16;
                    x(i,[11:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:4])=5;
                        x(i,[5:10])=25;
                        x(i,[11:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                            x(i,[1:4])=5;
                            x(i,[5:10])=40;
                            x(i,[11:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:4])=16;
                                x(i,[5:10])=5;
                                x(i,[11:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:4])=16;
                                        x(i,[5:10])=25;
                                        x(i,[11:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:4])=16;
                                           x(i,[5:10])=40;
                                           x(i,[11:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:4])=25;
                                              x(i,[5:10])=5;
                                              x(i,[11:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:4])=25;
                                                  x(i,[5:10])=16;
                                                  x(i,[11:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)> 64 && E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:4])=25;
                                                          x(i,[5:10])=40;
                                                          x(i,[11:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:4])=40;
                                                              x(i,[5:10])=5;
                                                              x(i,[11:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:4])=40;
                                                                   x(i,[5:10])=16;
                                                                   x(i,[11:24])=40;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:4])=40;
                                                                       x(i,[5:10])=25;
                                                                       x(i,[11:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else   
        if(rem(i,4)==0)
            if(E_req1(i,e)<=20 && E_req2(i,e)<=20)
                x(i,[1:24])=5;
            else
                if(E_req1(i,e)<=20 && (E_req2(i,e)>20 &&E_req2(i,e)<=64))
                    x(i,[1:8])=5;
                    x(i,[9:18])=16;
                    x(i,[19:24])=5;
                else
                    if(E_req1(i,e)<=20 && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                        x(i,[1:8])=5;
                        x(i,[9:18])=25;
                        x(i,[19:24])=5;
                    else
                        if(E_req1(i,e)<=20 && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                            x(i,[1:8])=5;
                            x(i,[9:18])=40;
                            x(i,[19:24])=5;
                        else
                            if((E_req1(i,e)>20 && E_req1(i,e)<=64) && E_req2(i,e)<=20)
                                x(i,[1:8])=16;
                                x(i,[9:18])=5;
                                x(i,[19:24])=16;
                            else
                                if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                    x(i,[1:24])=16;
                                else
                                    if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                        x(i,[1:8])=16;
                                        x(i,[9:18])=25;
                                        x(i,[19:24])=16;
                                    else
                                       if((E_req1(i,e)>20 && E_req1(i,e)<=64) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                           x(i,[1:8])=16;
                                           x(i,[9:18])=40;
                                           x(i,[19:24])=16;
                                       else
                                          if((E_req1(i,e)>64 && E_req1(i,e)<=100) && E_req2(i,e)<=20)
                                              x(i,[1:8])=25;
                                              x(i,[9:18])=5;
                                              x(i,[19:24])=25;
                                          else
                                              if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                  x(i,[1:8])=25;
                                                  x(i,[9:18])=16;
                                                  x(i,[19:24])=25;
                                              else
                                                  if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>64 &&E_req2(i,e)<=100))
                                                      x(i,[1:24])=25;
                                                  else
                                                      if((E_req1(i,e)>64 && E_req1(i,e)<=100) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                          x(i,[1:8])=25;
                                                          x(i,[9:18])=40;
                                                          x(i,[19:24])=25;
                                                      else
                                                          if((E_req1(i,e)>100 && E_req1(i,e)<=160) && E_req2(i,e)<=20)
                                                              x(i,[1:8])=40;
                                                              x(i,[9:18])=5;
                                                              x(i,[19:24])=40;
                                                          else
                                                               if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>20 && E_req2(i,e)<=64))
                                                                   x(i,[1:8])=40;
                                                                   x(i,[9:18])=16;
                                                                   x(i,[19:24])=40;
                                                               else
                                                                   if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>64 && E_req2(i,e)<=100))
                                                                       x(i,[1:8])=40;
                                                                       x(i,[9:18])=25;
                                                                       x(i,[19:24])=40;
                                                                   else
                                                                       if((E_req1(i,e)>100 && E_req1(i,e)<=160) && (E_req2(i,e)>100 && E_req2(i,e)<=160))
                                                                           x(i,[1:24])=40;
                                                                       end
                                                                   end
                                                               end
                                                          end
                                                      end
                                                  end
                                              end
                                          end
                                       end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        end
        end
        end
    end
    disp(i)
end



                             
end