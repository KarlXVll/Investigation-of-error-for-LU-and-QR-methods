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
 s = s1;
 j = j1;
 j(1,1) = j(1,1) * 10^i;
 T = s * j * s';
 BL = T*X;
 C = chol(T);
 X3 = inv(C) * inv(C') * BL;
 pogrCh(i) = norm(X3 - X) / norm(X);
end
plot((pogrCh), 'LineStyle',"--","Color","cyan");
