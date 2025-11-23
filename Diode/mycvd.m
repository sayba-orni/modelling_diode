function [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mycvd(matD,matR,matV,node)
matVnew=matV;

ans_from_func=myMNA_CVD(matD,matR,matV)
ansnew=[0]

ansexp=myMNA_EXP(matD,matR,matV,node);

matEv=matD;

matEv=sortrows(matEv);

matD=sortrows(matD);

stringV='';

stringI='';
stringErrV='';
stringErrI='';
temp_I='';

diodecurr=zeros(size(matD,1),1);

for m=1:size(matD)

    if ans_from_func(node+size(matV,1)+m)>0

        matEv(m,:)=0

    else matD(m,:)=0

    end
end

matD(all(~matD,2),:)=[]

matEv(all(~matEv,2),:)=[]

if isempty(matEv)

    for m=1:size(matD,1)

        if matD(m,3)==0

            d_V=ans_from_func(matD(m,2));

            d_V1=ansexp(matD(m,2));

        elseif matD(m,2)==0

            d_V=-ans_from_func(matD(m,3));

            d_V1=-ansexp(matD(m,3));
        else
            d_V=ans_from_func(matD(m,2))-ans_from_func(matD(m,3));

            d_V1=ansexp(matD(m,2))-ansexp(matD(m,3));

        end
        temp_V=sprintf('diode %d is forward and voltage is %d V\n',...
            matD(m,1),d_V);

        stringV=char({stringV;temp_V});
        
        d_I=ans_from_func(node+size(matV,1)+m);

        diodecurr(matD(m,1),1)=d_I

        temp_I=sprintf('diode %d is forward and current is %d A\n',...
            matD(m,1),d_I);

        stringI=char({stringI;temp_I});
        
        Idiode=5e-17*(exp(d_V1/26e-3)-1)

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),abs(d_V-d_V1)*100/abs(d_V1));

        stringErrV=char({stringErrV;temp_ErrV});
    end
else matEv=[matEv 1e15*ones(size(matEv,1),1)]
    
    matR=[matR; matEv]

    ansnew=myMNA_CVD(matD,matR,matVnew)

    for m=1:size(matEv,1)

        if matEv(m,3)==0
            d_V=ansnew(matEv(m,2));


            d_V1=ansexp(matEv(m,2));

        elseif matEv(m,2)==0

            d_V=-ansnew(matEv(m,3));

            d_V1=-ansexp(matEv(m,3));
        else

            d_V=ansnew(matEv(m,2))-ansnew(matEv(m,3));

            d_V1=ansexp(matEv(m,2))-ansexp(matEv(m,3));
        end
        temp_V=sprintf('diode %d is reverse biased and voltage is %d V\n',...
            matEv(m,1),d_V);

        stringV=char({stringV;temp_V});

          diodecurr(matEv(m,1),1)=d_V/1e12

        temp_I=sprintf('diode %d is reverse biased and current is %d A\n',...
            matEv(m,1),d_V/1e12);

        stringI=char({stringI;temp_I});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matEv(m,1),abs(d_V-d_V1)*100/abs(d_V1));

        stringErrV=char({stringErrV;temp_ErrV});
        
       
        d_I=d_V/1e16;

        Idiode=5e-17*(exp(d_V1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matEv(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
    end
    for m=1:size(matD,1)

        if matD(m,3)==0

            d_V=ansnew(matD(m,2));

            d_V1=ansexp(matD(m,2));
        elseif matD(m,2)==0

            d_V=-ansnew(matD(m,3));

            d_V1=-ansexp(matD(m,3));
        else
            d_V=ansnew(matD(m,2))-ansnew(matD(m,3));

            d_V1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end
        temp_V=sprintf('diode %d is forward and voltage is %d V\n',...
            matD(m,1),d_V);

        stringV=char({stringV;temp_V});

        diodecurr(matD(m,1),1)=ansnew(node+size(matV,1)+m)

        temp_I=sprintf('diode %d is forward and current is %d A\n',...
            matD(m,1),ansnew(node+size(matV,1)+m));

        stringI=char({stringI;temp_I});

        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),abs(d_V-d_V1)*100/abs(d_V1));

        stringErrV=char({stringErrV;temp_ErrV});

        d_I=ansnew(node+size(matV,1)+m);
        
        Idiode=5e-17*(exp(d_V1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
        
    end
end
