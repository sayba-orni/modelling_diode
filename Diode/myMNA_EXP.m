function ans_from_func=myMNA_EXP(matD,matR,matV,node);

%% diode parameters

V_t=26e-3;

Isat=5e-17;

Idiode=0.1;

Vdiode=V_t*log(1 + Idiode/Isat);

eqG=Isat/V_t*exp(Vdiode/V_t);

eqI=Idiode-eqG*Vdiode;

Vd_temp = 1;

no_V=size(matV,1);

%% Initialising diode values

ndiode = size(matD, 1); 

Idiode(1 : ndiode)=0.1; 

Vdiode(1 : ndiode)=V_t*log(1 + Idiode/Isat);

eqG(1 : ndiode)=Isat/V_t*exp(Vdiode/V_t);

eqI(1 : ndiode)=Idiode- eqG.*Vdiode;

Vd_temp(1 : ndiode) = 1;

itr=1;

%% iterations

while(max(abs(Vd_temp-Vdiode))>1e-6)        
        
        G1 = matrixG(matR, node);

        matR2=[matD 1./eqG'];

        G2 = matrixG(matR2, node);

        G = G1+G2;
        
        B = matrixB(node,matV);

        Bp = B';

        D = zeros(no_V);

        MNA = [G B;Bp D];

        I = [matD eqI'];% diodes are treated as current sources 

        i = matrixI(I,node);

        z = [i;matV(:,4)];

        ans_from_func = inv(MNA)*z;

        v = ans_from_func(1 : node);

        curr = ans_from_func(node+1 : end);

        Vd_temp(1 : end) = Vdiode; % stores Vd from previous iteration 

        % calculating the diode node voltage

        for i = 1 : size(matD, 1)

            positive = matD(i, 2);

            negative = matD(i, 3);

            if negative == 0

                Vdiode(i) = ans_from_func(positive);

            elseif positive == 0

                Vdiode(i) = -ans_from_func(negative);

            else

                Vdiode(i) = ans_from_func(positive) - ans_from_func(negative);

            end
        end

        Idiode = Isat*(exp(Vdiode/V_t) - 1);

        eqG = Isat/V_t*exp(Vdiode/V_t);

        eqI = Idiode - eqG.*Vdiode;
        
        itr = itr + 1;
end






