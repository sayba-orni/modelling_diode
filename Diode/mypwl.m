function [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mypwl(matD,matR,matV,node);
matVnew=matV;


ans_from_func=myMNA_PWL(matD,matR,matV)
ansnew=[0]

ansexp=myMNA_EXP(matD,matR,matV,node);

matEv=matD;

stringV='';
stringI='';
stringErrV='';
stringErrI='';

temp_I='';

diodecurr=zeros(size(matD,1),1);

for m=1:size(matD)

    if matD(m,3)==0

        dVolt=ans_from_func(matD(m,2));

    elseif matD(m,2)==0

        dVolt=-ans_from_func(matD(m,3));

    else
        dVolt=ans_from_func(matD(m,2))-ans_from_func(matD(m,3));
    end
    if (-0.65/20+dVolt/20)>0
        matEv(m,:)=0;

    else matD(m,:)=0;
    end

end
matD(all(~matD,2),:)=[];

matEv(all(~matEv,2),:)=[];

if isempty(matEv)
    for m=1:size(matD,1)

        if matD(m,3)==0

           dVolt=ans_from_func(matD(m,2));

           dVolt1=ansexp(matD(m,2));
        elseif matD(m,2)==0

            dVolt=-ans_from_func(matD(m,3));

            dVolt1=-ansexp(matD(m,3));
        else
            dVolt=ans_from_func(matD(m,2))-ans_from_func(matD(m,3));

            dVolt1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end

        temp_V=sprintf('diode %d is forward biased and voltage is %d V\n',...
            matD(m,1),dVolt);

        stringV=char({stringV;temp_V});

         diodecurr(matD(m,1),1)=-0.65/20+dVolt/20

        temp_I=sprintf('diode %d is forward biased and current is %d A\n',...
            matD(m,1),-0.65/20+dVolt/20);

        stringI=char({stringI;temp_I});

        Idiode=5e-17*(exp(dVolt1/26e-3)-1);

        d_I=-0.65/20+dVolt/20;

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
        tempErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),abs(dVolt-dVolt1)*100/abs(dVolt1));

        stringErrV=char({stringErrV;tempErrV});
    end
else matEv=[matEv 1e15*ones(size(matEv,1),1)];

    matR=[matR; matEv];

    ansnew=myMNA_PWL(matD,matR,matVnew)

    for m=1:size(matEv,1)

       if matEv(m,3)==0

            dVolt=ansnew(matEv(m,2));

            dVolt1=ansexp(matEv(m,2));

        elseif matEv(m,2)==0
            dVolt=-ansnew(matEv(m,3));

            dVolt1=-ansexp(matEv(m,3));
        else
            dVolt=ansnew(matEv(m,2))-ansnew(matEv(m,3));

            dVolt1=ansexp(matEv(m,2))-ansexp(matEv(m,3));
       end

        temp_V=sprintf('diode %d is reverse biased and voltage is %d V\n',...
            matEv(m,1),dVolt);

        stringV=char({stringV;temp_V});

        diodecurr(matEv(m,1),1)=dVolt/1e16

        temp_I=sprintf('diode %d is reverse biased and current is %d A\n',...
            matEv(m,1),dVolt/1e16);

        stringI=char({stringI;temp_I});
        
        tempErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matEv(m,1),abs(dVolt-dVolt1)*100/abs(dVolt1));
        
        stringErrV=char({stringErrV;tempErrV});
        
       
        d_I=dVolt/1e16;

        Idiode=5e-17*(exp(dVolt1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matEv(m,1),abs(Idiode-d_I)*100/abs(Idiode));
        
        stringErrI=char({stringErrI;temp_ErrI});
        
        
    end
    for m=1:size(matD,1)

        if matD(m,3)==0

            dVolt=ansnew(matD(m,2));

            dVolt1=ansexp(matD(m,2));

        elseif matD(m,2)==0

            dVolt=-ansnew(matD(m,3));

            dVolt1=-ansexp(matD(m,3));
        else
            dVolt=ansnew(matD(m,2))-ansnew(matD(m,3));

            dVolt1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end

        temp_V=sprintf('diode %d is forward biased and voltage is %d V\n',...
            matD(m,1),dVolt);

        stringV=char({stringV;temp_V});

         diodecurr(matD(m,1),1)=-0.65/20+dVolt/20

        temp_I=sprintf('diode %d is forward biased and current is %d A\n',...
            matD(m,1),-0.65/20+dVolt/20);

        stringI=char({stringI;temp_I});
        
        tempErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),abs(dVolt-dVolt1)*100/abs(dVolt1));

        stringErrV=char({stringErrV;tempErrV});

        d_I=(dVolt-0.65)/20;
        
        Idiode=5e-17*(exp(dVolt1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
       
        
    end
end
