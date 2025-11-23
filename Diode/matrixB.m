function B = matrixB(nodes,matV)
no_V=size(matV,1);

B=ones(nodes,no_V);
for m=1:nodes
    for n=1:no_V
        if matV(n,2)==m
            B(m,n)=1;
        elseif matV(n,3)==m
            B(m,n)=-1;
        else B(m,n)=0;
        end
    end
end