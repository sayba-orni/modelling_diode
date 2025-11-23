function imat = matrixI(matI, nodes)

imat = zeros(nodes,1);

for i = 1 : nodes
    for j = 1 : size(matI, 1)
        if matI(j, 2) == i
            imat(i) = imat(i) - matI(j, 4);
        elseif matI(j, 3) == i
            imat(i) = imat(i) + matI(j, 4);
        end
    end
end

