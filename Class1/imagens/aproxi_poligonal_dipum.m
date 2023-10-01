clear all, close all
 
% %I=imread('.\..\..\..\nova\imagens\folha.jpg');
% figure, imshow(I);
% %converter para escala cinza
% J=rgb2gray(I);
% figure, imshow(J);
% %binarizar
% th=graythresh(J);
% BW=im2bw(J,th);

BW=imread('.\..\..\..\nova\imagens\folha_aprox_poli.tif');
%BW=imread('.\..\..\..\nova\imagens\triangulo_aprox_polig.jpg');
%BW=imread('.\..\..\..\nova\imagens\quad_aprox_polig.jpg');
% th=graythresh(BW);
%  BW=im2bw(BW,th);
%BW=rgb2gray(BW);
figure, imshow(BW);
%inverter as cores
%  A=~(BW);
%  figure, imshow(A);
 B=bwboundaries(BW);%extrair fronteira dos objectos presentes na imagem
 hold on

d=cellfun('length',B);
[max_d,k]=max(d);
v=B{k}; %k devolve a regiao com a maior fronteira
plot(v(:,2), v(:,1), 'r', 'LineWidth', 2);   

xmin=min(v(:,1));
ymin=min(v(:,2));
[M N]=size(BW);

[x1 y1]=minperpoly(BW,4);
b2=connectpoly(x1,y1);
bim=bound2im(b2,M,N,xmin,ymin);
figure,  imshow(bim);

[x2 y2]=minperpoly(BW,16);
b2=connectpoly(x2,y2);
bim=bound2im(b2,M,N,xmin,ymin);
figure,  imshow(bim);
