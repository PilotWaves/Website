function [LE] = LeastEffect_BTCS(Vol,U_thresh,eps)

%Ethanol diffusion in tumor

%     Vol = 0.2;
%  U_thresh = 0.25;
%  eps=1;

dr = 0.005;
dt = dr*10;
nu = dt/dr;
mu = dt/dr^2;
T = 20;
X = 1;
N = round(T/dt + 1);
M = round(X/dr + 1);

LE = 0;

r = [0:dr:1];

U = zeros(M,N);
A = zeros(M);
width = 1;
r1 = round(length(r)*width);
height = Vol/(sum((r(1:r1 - 1).^2).*exp(1 - 1./(1 - (r(1:r1 - 1)/r(r1)).^2)))*dr*4*pi);
U(1:r1 - 1,1) = exp(1 - 1./(1 - (r(1:r1 - 1)/r(r1)).^2))*(height);

for n = 2:N
    
    %Point at origin
     A(1,1) = mu + 1; A(1,2) = -mu;
     A(M,M) = mu + 1 + eps*dr*(nu + mu); A(M,M-1) = -mu;
    
   %Points in the middle
   
   for m = 2:M-1
        A(m,m+1) = -nu/(2*r(m)) - mu/2; A(m,m) = mu + 1;
        A(m,m-1) = nu/(2*r(m)) - mu/2;
        
           if U(m,n-1) >= U_thresh
                LE = Vol;
           end
   
   end
   
   if LE ~= 0
       break
   end
   
   U(:,n) = (A^(-1))*U(:,n-1);
end