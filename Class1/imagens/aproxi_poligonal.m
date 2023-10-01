clear all, close all
 
% %I=imread('.\..\..\..\nova\imagens\folha.jpg');
% figure, imshow(I);
% %converter para escala cinza
% J=rgb2gray(I);
% figure, imshow(J);
% %binarizar
% th=graythresh(J);
% BW=im2bw(J,th);

%BW=imread('.\..\..\..\nova\imagens\folha_aprox_poli.tif');
%BW=imread('.\..\..\..\nova\imagens\triangulo_aprox_polig2.jpg');
BW=imread('.\..\..\..\nova\imagens\quad_aprox_polig.jpg');
th=graythresh(BW);
BW=im2bw(BW,th);
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

[val, pos_1]=min(v(:,2));
[val, pos_2]=max(v(:,2));
d_max=0;
v_aux=v(1:20:end,:);
for i=1:size(v_aux,1),
    d= sqrt( (v_aux(i,1)-v(pos_1,1))^2 + (v_aux(i,2)-v(pos_1,2))^2 );
    if d >d_max
        d_max=d;
        pos_2=i;
    end
end
pos_2=pos_2*20;


vert =[ ]; Erro =80;  
[vert]=AP_recursiva(pos_1, pos_2, v, vert, Erro);

pos_f=size(v,1);
[vert]=AP_recursiva(pos_2, pos_f, v, vert, Erro);

[vert]=[vert, pos_f];

 C=v([vert],:);
 b2=connectpoly(C(:,1),C(:,2));
 
 [M N]=size(BW);
 xmin=min(v(:,1));
 ymin=min(v(:,2)); 
% fechar=size(C,1);
%  C(fechar+1,:)= C(1,:);
 figure(1), hold on, plot(C(:,2),C(:,1),'g','LineWidth', 5);

%figure(1), hold on, plot(C(1,1),C(1,2),'g');
%plot(v(:,2), v(:,1), 'b', 'LineWidth', 2);
bim=bound2im(b2,M,N,xmin,ymin);
 figure,  imshow(bim);
% 
% [x2 y2]=minperpoly(BW,16);
% b2=connectpoly(x2,y2);
% bim=bound2im(b2,M,N,xmin,ymin);
% figure,  imshow(bim);
