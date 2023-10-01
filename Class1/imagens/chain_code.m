clear all, close all
 
I=imread('.\..\..\..\nova\imagens\folha.jpg');
figure, imshow(I);
%converter para escala cinza
J=rgb2gray(I);
figure, imshow(J);
%binarizar
th=graythresh(J);
BW=im2bw(J,th);

figure, imshow(BW);
%inverter as cores
  A=~(BW);
%  figure, imshow(A);
 B=bwboundaries(A);%extrair fronteira dos objectos presentes na imagem
 hold on

 for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2);   
 end
 
 %
% % se tiver varios objectos: extrai a maior fronteira presente na imagem
% % v e um vector np x 2
%
d=cellfun('length',B);
[max_d,k]=max(d);
v=B{k}; %k devolve a regiao com a maior fronteira

[x_max, pos_max]=max(v(:,1));
[x_min, pos_min]=min(v(:,1));
[y_max, pos_max]=max(v(:,2));
[y_min, pos_min]=min(v(:,2));

comprimento_folha= x_max - x_min
largura_folha= y_max - y_min
perimetro =bwperim(A)


 
 