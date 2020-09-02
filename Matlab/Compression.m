A=rgb2gray(imread('basket.jpg'));
imshow(A);
[U,S,V]=svd(double(A));
r=25; % Rank-r approximation
Acomp=U(:,1:r)*S(1:r,1:r)*(V(:,1:r))';
imshow(uint8(Acomp));
