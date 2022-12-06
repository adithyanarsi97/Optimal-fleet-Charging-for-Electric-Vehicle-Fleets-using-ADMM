function [A, R_lbar, R_hbar]= constraint2(e,m,E_req1,E_req2,eta_ch,del_t)
if(m==1)
    A1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
    A=zeros(80,24);
    for i=1:2:80
        A([i:i+1],:)=A1;
    end
    j1=1;
    for i=1:2:80
        R_lbar(i)=E_req1(j1,e)/(eta_ch*del_t); 
        R_hbar(i)=E_req1(j1,e)/(eta_ch*del_t);
        R_lbar(i+1)=E_req2(j1,e)/(eta_ch*del_t); 
        R_hbar(i+1)=E_req2(j1,e)/(eta_ch*del_t);
        j1=j1+1;
    end
    % Bounds on Energy Requirement
       R_lbar=reshape(R_lbar,80,1);
       R_hbar=reshape(R_hbar,80,1);

else
    if(m==2)
        A1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
        A2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 ; ...
            0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        A3=[0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ; ...
            0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
       A4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 ; ...
           0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0];
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
       j1=1;
       for i=1:2:80
           R_lbar(i)=E_req1(j1,e)/(eta_ch*del_t); 
           R_lbar(i+1)=E_req2(j1,e)/(eta_ch*del_t);
           j1=j1+1;
       end
       R_hbar=R_lbar;
       % Bounds on Energy Requirement
       R_lbar=reshape(R_lbar,80,1);
       R_hbar=reshape(R_hbar,80,1);
    end
end

end
