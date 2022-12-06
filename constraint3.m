function [B, S_lbar, S_hbar]= constraint3(e,m,E_req1,E_req2,E_bat,eta_ch,del_t)

if(m==1)
    B1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 ; ...
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 ; ...
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 ; ...
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
        1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ];
   for i=1:8:320
      B([i:i+7],:)=B1;
   end
   % Bounds on energy state
   j2=1;
   for i=1:8:320
       S_lbar(i)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
       S_lbar(i+1)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
       S_lbar(i+2)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
       S_lbar(i+3)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);

       S_lbar(i+4)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat); 
       S_lbar(i+5)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);
       S_lbar(i+6)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);
       S_lbar(i+7)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);


       S_hbar(i)=(1/eta_ch*del_t)*E_req1(j2,e);
       S_hbar(i+1)=(1/eta_ch*del_t)*E_req1(j2,e);
       S_hbar(i+2)=(1/eta_ch*del_t)*E_req1(j2,e);
       S_hbar(i+3)=(1/eta_ch*del_t)*E_req1(j2,e);

       S_hbar(i+4)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
       S_hbar(i+5)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
       S_hbar(i+6)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
       S_hbar(i+7)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
       j2=j2+1;
   end
   S_lbar=reshape(S_lbar,320,1);
   S_hbar=reshape(S_hbar,320,1);
else
    if(m==2)     
        B1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 ; ...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 ; ...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 ; ...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ; ...
            1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 ];
 
        B2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 ;...
            0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;...
            0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;...
            0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;...
            0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1];

        B3=[0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 1 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 1 1 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ;...
            0 0 0 1 1 1 1 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0];

        B4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 ;...
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 ;...
            0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 ;...
            0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 1 1 0 0 ;...
            0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 1 1 1 1 0 0 ;...
            0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 1 1 1 1 0 0];
        
        Bbar=[B1;B2;B3;B4];
        t3=1;
        for i=1:8:320
            if(t3==33)
                t3=1;
            end
            B([i:i+7],:)=Bbar([t3:t3+7],:);
            t3=t3+8;
        end
        % Bounds on energy state
        j2=1;
        for i=1:8:320
            S_lbar(i)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
            S_lbar(i+1)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
            S_lbar(i+2)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);
            S_lbar(i+3)=(1/eta_ch*del_t)*(E_req1(j2,e)-E_bat);

            S_lbar(i+4)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat); 
            S_lbar(i+5)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);
            S_lbar(i+6)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);
            S_lbar(i+7)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e)-E_bat);


            S_hbar(i)=(1/eta_ch*del_t)*E_req1(j2,e);
            S_hbar(i+1)=(1/eta_ch*del_t)*E_req1(j2,e);
            S_hbar(i+2)=(1/eta_ch*del_t)*E_req1(j2,e);
            S_hbar(i+3)=(1/eta_ch*del_t)*E_req1(j2,e);

            S_hbar(i+4)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
            S_hbar(i+5)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
            S_hbar(i+6)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
            S_hbar(i+7)=(1/eta_ch*del_t)*(E_req1(j2,e)+E_req2(j2,e));
            j2=j2+1;
        end
        S_lbar=reshape(S_lbar,320,1);
        S_hbar=reshape(S_hbar,320,1);
    end
end

end

