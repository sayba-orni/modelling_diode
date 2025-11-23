function [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myidm(matD,matR,matV,node)
matVnew=matV;

ans_from_func=myMNA_IDM(matD,matR,matV)
ansnew=[0]

ansexp=myMNA_EXP(matD,matR,matV,node)

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

        matEv(m,:)=0;

    else matD(m,:)=0;
    end
end
matD(all(~matD,2),:)=[];

matEv(all(~matEv,2),:)=[];

if isempty(matEv)
    for m=1:size(matD,1)
        
        temp_V=sprintf('diode %d is forward and it is short circuited\n',...
            matD(m,1));

        stringV=char({stringV;temp_V});

        diodecurr(matD(m,1),1)=ans_from_func(node+size(matV,1)+m)

        temp_I=sprintf('diode %d current is %d A\n',...
            matD(m,1),ans_from_func(node+size(matV,1)+m));

        stringI=char({stringI;temp_I});
         
        if matD(m,3)==0
            
            d_V1=ansexp(matD(m,2));
        elseif matD(m,2)==0
            
            d_V1=-ansexp(matD(m,3));
        else
            
            d_V1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end
        
        d_I=ans_from_func(node+size(matV,1)+m);

        Idiode=5e-17*(exp(d_V1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),100);
        stringErrV=char({stringErrV;temp_ErrV});
        
    end
else matEv=[matEv 1e15*ones(size(matEv,1),1)];

    matR=[matR; matEv];

    ansnew=myMNA_IDM(matD,matR,matVnew)

    size(matEv,1)
    for m=1:size(matEv,1)
        loopinside=m
        if matD(m,3)==0

            d_V=ansnew(matD(m,2))

            d_V1=ansexp(matD(m,2));
        elseif matD(m,2)==0
            d_V=-ansnew(matD(m,3));

            d_V1=-ansexp(matD(m,3));
        else
            d_V=ansnew(matD(m,2))-ansnew(matD(m,3));

            d_V1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end
        
        
        temp_V=sprintf('diode %d is reverse and voltage is %d V\n',...
            matEv(m,1),d_V);

        stringV=char({stringV;temp_V});

        diodecurr(matEv(m,1),1)=0

        temp_I=sprintf('diode %d is reverse and it is open circuited \n',...
            matEv(m,1));

        stringI=char({stringI;temp_I});
        
          
        Idiode=5e-17*(exp(d_V1/26e-3)-1)

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matEv(m,1),100);

        stringErrI=char({stringErrI;temp_ErrI});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matEv(m,1),abs(d_V-d_V1)*100/abs(d_V1));

        stringErrV=char({stringErrV;temp_ErrV});
        
        
    end
    for m=1:size(matD,1)
        
        temp_V=sprintf('diode %d is forward and it is short circuited\n',...
            matD(m,1));

        stringV=char({stringV;temp_V});

         diodecurr(matD(m,1),1)=ansnew(node+size(matV,1)+m)

        temp_I=sprintf('diode %d current is %d A\n',...
            matD(m,1),ansnew(node+size(matV,1)+m));

        stringI=char({stringI;temp_I});
        
        if matD(m,3)==0
            
            d_V1=ansexp(matD(m,2));
        elseif matD(m,2)==0
            
            d_V1=-ansexp(matD(m,3));
        else
            
            d_V1=ansexp(matD(m,2))-ansexp(matD(m,3));
        end
        
        d_I=ansnew(node+size(matV,1)+m);

        Idiode=5e-17*(exp(d_V1/26e-3)-1);

        temp_ErrI=sprintf('Error in diode %d current is %d percent\n',...
            matD(m,1),abs(Idiode-d_I)*100/abs(Idiode));

        stringErrI=char({stringErrI;temp_ErrI});
        
        temp_ErrV=sprintf('Error in diode %d voltage is %d percent\n',...
            matD(m,1),100);

        stringErrV=char({stringErrV;temp_ErrV});
        
        
     
    end
end