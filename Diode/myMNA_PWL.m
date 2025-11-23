function ans_from_func=myMNA_PWL(matD,matR,matV)

node = max([max(matD(:,2:3)) max(matR(:,2:3)) max(matV(:,2:3))]);

no_V=size(matV,1);

matR=[matR;matD 20*ones(size(matD,1),1)];

G = matrixG(matR,node);

B = matrixB(node,matV);

Bp=B';

D=zeros(no_V);
MNA=[G B;Bp D];

I=[matD -0.65/20*ones(size(matD,1),1)];

z=[matrixI(I,node);matV(:,4)];

ans_from_func=inv(MNA)*z

