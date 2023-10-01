function [vert]= AP_recursiva(pos_1, pos_2, B, vert, Erro)
% vert - Vector de vertices encontrados na aproximação poligonal
% pos_1 e pos_2 - Indices da posição no contorno dos dois pontos com que se inicia o algoritmo
% B - Contorno da região fechada.
% Erro - Parâmetro que controla o grau de aproximação. Erro menor --> mais vértices, Erro maior --> Mais vértice  
P1=B(pos_1,:);P2=B(pos_2,:);
m=(P2(1)-P1(1))/(P2(2)-P1(2));  
a= -m; b=1; c= -P1(1)+m*P1(2);
den=sqrt(a*a + b*b);
dist=abs(a*B(pos_1:pos_2,2) + B(pos_1:pos_2,1) +c)/den;

[max_d, pos_vert]=max(dist);
pos_vert = pos_vert + pos_1 - 1;
primeiro=pos_1;
ultimo=pos_vert;
    
if(max_d > Erro)
    pto_vert=B(pos_vert,:);

    [vert]=AP_recursiva(primeiro, ultimo, B, vert, Erro);
    primeiro=pos_vert;
    ultimo=pos_2;
    [vert]=AP_recursiva(primeiro, ultimo, B, vert, Erro);
else
    vert=[vert, (primeiro)];   
end
return
end

