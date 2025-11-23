function ans_from_func=myMNA_IDM(matD,matR,matV)
node = max([max(matD(:,2:3)) max(matR(:,2:3)) max(matV(:,2:3))]);
n = size(matD);
ndiode = 1e-4*ones(n(1),1);
n1=size(matV);
matV  = [matV;matD(:,1)+n1(1) matD(:,2:3) ndiode];
matV=sortrows(matV);
nV=size(matV,1);
G = matrixG(matR,node);
B = matrixB(node,matV);
Bp=B';
D=zeros(nV);
MNA=[G B;Bp D];
z=[zeros(node,1);matV(:,4)];
ans_from_func=inv(MNA)*z

