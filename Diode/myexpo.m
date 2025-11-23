function [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myexpo(matD,matR,matV,node);
ans_from_func=myMNA_EXP(matD,matR,matV,node)
matD
matD=sortrows(matD)

ansnew=[0];


Isat=5e-17;

V_t=26e-3;

stringV='';          
stringI='';
stringErrV='';
stringErrI='';

temp_I='';
diodecurr=zeros(size(matD,1),1);

for m=1:size(matD,1)

    if matD(m,3)==0

        V_d=ans_from_func(matD(m,2));

    elseif matD(m,2)==0
        V_d=-ans_from_func(matD(m,3));

    else
        V_d=ans_from_func(matD(m,2))-ans_from_func(matD(m,3));
    end
    if V_d>0

        temp_V=sprintf('diode %d is forward biased and voltage is %d V\n',...
            matD(m,1),V_d);

        stringV=char({stringV;temp_V});

        diodecurr(m,1)=Isat*(exp(V_d/V_t) - 1)

        temp_I=sprintf('diode %d current is %d A\n',...
            matD(m,1),Isat*(exp(V_d/V_t) - 1));

        stringI=char({stringI;temp_I});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),0);

        stringErrV=char({stringErrV;temp_ErrV});

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),0);


        stringErrI=char({stringErrI;temp_ErrI});
        

    else temp_V=sprintf('diode %d is reverse biased and voltage is %d V\n',...
            matD(m,1),V_d);

        stringV=char({stringV;temp_V});

        diodecurr(m,1)=-Isat

        temp_I=sprintf('diode %d is reverse biased and current is %d A\n',...
            matD(m,1),-Isat);

        stringI=char({stringI;temp_I});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),0);

        stringErrV=char({stringErrV;temp_ErrV});
      
        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),0);

        stringErrI=char({stringErrI;temp_ErrI});
        
    end
end

ans_from_func

