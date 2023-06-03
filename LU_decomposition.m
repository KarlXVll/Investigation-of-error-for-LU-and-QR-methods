clear all;
hold on;
k_k = 12;
for i = 1:k_k
 j1(i,i) = rand(1);
end
s1= orth(rand(k_k));
A = s1*j1*(s1');
X = rand(k_k,1);
B = A*X;
for i = 1:15
 [s,j] = eig(A);
 j(1,1) = j(1,1)*10^(i);
 T = s*j*s^(-1);
 BL = T*X;
 [L,U] = lu(T);
 X1 = inv(U) * inv(L) * BL;
 pogrLU(i) = norm(X1 - X) / norm(X);
 [Q, R] = qr(T);
 X2 = inv(R) * inv(Q) * BL;
 pogrQR(i) = norm(X2 - X) / norm(X);
end
plot((pogrLU), 'LineStyle', "--", "Color", "black");
