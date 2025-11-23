function ans_from_func=myMNA_CVD(matD,matR,matV)

node = max([max(matD(:,2:3)) max(matR(:,2:3)) max(matV(:,2:3))]);

%considering each diode as a voltage source

ndiode = 0.7*ones(size(matD,1),1)

matDSOURCE=matD(:,1)+size(matV,1)


matV  = [matV;matDSOURCE matD(:,2:3) ndiode]

matV=sortrows(matV);

no_V=size(matV,1);

G = matrixG(matR,node);

B = matrixB(node,matV);

Bp=B';

D=zeros(no_V);

MNA=[G B;Bp D];

z=[zeros(node,1);matV(:,4)];

ans_from_func=inv(MNA)*z;

