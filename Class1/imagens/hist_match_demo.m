clear all;

I_ref=imread('babesia_1.jpg');
I_2adj=imread('babesia_3.jpg');

figure(2), imshow(I_2adj); set(2,'Name', 'To Adjust')
figure(1), imshow(I_ref); set(1,'Name', 'Reference')

I_adj = imhistmatch(I_2adj,I_ref);
figure(3), imshow(I_adj);  set(3,'Name', 'Adjusted')
