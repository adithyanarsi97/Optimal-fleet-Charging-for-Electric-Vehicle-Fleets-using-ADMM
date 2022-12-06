function [A, R_lbar, R_hbar]= constraint2sd(e,m,E_req,eta_ch,del_t)

if(m==1)
    A1=[ones(1,4) zeros(1,16) ones(1,4)];
    A=zeros(40,24);
    for i=1:40
        A(i,:)=A1;
    end
    j1=1;
    for i=1:40
        R_lbar(i)=E_req(j1,e)/(eta_ch*del_t); 
        R_hbar(i)=E_req(j1,e)/(eta_ch*del_t);
        j1=j1+1;
    end
    % Bounds on Energy Requirement
       R_lbar=reshape(R_lbar,40,1);
       R_hbar=reshape(R_hbar,40,1);
else
    if(m==2)
        A1=[ones(1,2) zeros(1,16) ones(1,6)];
        A2=[ones(1,6) zeros(1,16) ones(1,2)];
        A3=[ones(1,4) zeros(1,16) ones(1,4)];
        A4=[zeros(1,16) ones(1,8)];
        Abar=[A1; A2 ;A3 ;A4];
        t2=1;
        A=zeros(40,24);
        for i=1:40
            if(t2==5)
                t2=1;
            end
            A(i,:)=Abar(t2,:);
            t2=t2+1;
        end
        j1=1;
        for i=1:40
            R_lbar(i)=E_req(j1,e)/(eta_ch*del_t); 
            R_hbar(i)=E_req(j1,e)/(eta_ch*del_t);
            j1=j1+1;
        end
        % Bounds on Energy Requirement
        R_lbar=reshape(R_lbar,40,1);
        R_hbar=reshape(R_hbar,40,1);
    end
end

end