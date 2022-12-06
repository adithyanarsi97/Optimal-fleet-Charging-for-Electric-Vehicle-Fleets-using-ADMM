function [A, R_lbar, R_hbar]= constraint2me(e,m,E_req1,E_req2,E_bat,eta_ch,del_t)

if(m==1)
    A1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0]; 
    A=zeros(80,24);
    for i=1:2:80
        A([i:i+1],:)=A1;
    end
    j1=1;
    for i=1:2:80
        R_lbar(i)=(E_req1(j1,e)+E_req2(j1,e)-E_bat)/(eta_ch*del_t); 
        R_lbar(i+1)=(E_req1(j1,e)+E_req2(j1,e))/(eta_ch*del_t); 
        R_hbar(i)=(E_req1(j1,e))/(eta_ch*del_t);
        R_hbar(i+1)=(E_req1(j1,e)+E_req2(j1,e))/(eta_ch*del_t);
        j1=j1+1;
    end
    % Bounds on Energy Requirement
       R_lbar=reshape(R_lbar,80,1);
       R_hbar=reshape(R_hbar,80,1);
else
    if(m==2)
        A1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0]; 
        A2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 ; ...
            0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1];
        A3=[0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ; ...
            0 0 0 0 1 1 1 1 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0];
        A4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 ; ...
            0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 1 1 1 1 0 0] ;
        t2=1;
        Abar=[A1;A2;A3;A4];
        A=zeros(80,24);
        for i=1:2:80
            if(t2==9)
                t2=1;
            end
            A([i,i+1],:)=Abar([t2,t2+1],:);
            t2=t2+2;
        end
        j11=1;
        for i=1:2:80
            R_lbar(i)=(E_req1(j11,e)+E_req2(j11,e)-E_bat)/(eta_ch*del_t);
            R_lbar(i+1)=(E_req1(j11,e)+E_req2(j11,e))/(eta_ch*del_t);
            j11=j11+1;
        end
        % Lower bound
        R_lbar=reshape(R_lbar,80,1);
        % Loop for upper bound
        j10=1;
        for i=1:2:80
            R_hbar(i)=(E_req1(j10,e))/(eta_ch*del_t);
            R_hbar(i+1)=(E_req1(j10,e)+E_req2(j10,e))/(eta_ch*del_t);
            j10=j10+1;
        end
        % Upper Bound
        R_hbar=reshape(R_hbar,80,1);
    end
end
end
