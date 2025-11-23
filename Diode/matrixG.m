function G = matrixG(matR,nodes)

G=zeros(nodes);

for m=1:size(matR,1)

    if ~ismember(0,matR(m,2:3))

        node_1 = matR(m,2);

        node_2 = matR(m,3);

        G(node_1,node_1) = G(node_1,node_1)+1/matR(m,4);

        G(node_2,node_2) = G(node_2,node_2)+1/matR(m,4);

        G(node_1,node_2) = G(node_1,node_2)-1/matR(m,4);

        G(node_2,node_1) = G(node_2,node_1)-1/matR(m,4);
    else
        node_1 = matR(m,2);

        node_2 = matR(m,3);

        if matR(m,2) == 0

            G(node_2,node_2) = G(node_2,node_2) + 1/matR(m,4);

        elseif matR(m,3) == 0

            G(node_1,node_1) = G(node_1,node_1) + 1/matR(m,4);
        end
    end
end