function [c,dc,y1,r2] = MC_incertidumbre(x,y,n,x1,w)
X=mean(x);
Y=mean(y);

m=length(x);
if m<n+1
    error('no hay suficientes puntos')
end 

if nargin < 5
    w=ones(1,m);
end

%terminos de la matriz
s=zeros(1,2*n+1);
for j=1:2*n+1
    s(j)= sum(w.*x.^(j-1));
end 

A=zeros(n+1);
for i=1:n+1
A(i,:)= s(i:n+i);
end


%Terminos independientes 
b=zeros(1,n+1);
for j=1:n+1
    b(j)= sum(y.*w.*x.^(j-1));
end 

%Calculamos la solucion

c=A\b';  %notese orden creciente 


%ESTA PARTE DEL CODIGO NOS CALCULA EL VALOR DE LA INCERTIDUMBRE EN UNA
%INTERPOLACION LINEAL.

if n==1
E= b(2)-m*mean(x)*mean(y);
D=s(3)-m*mean(x)^2;
sres2= sum((y-c(2).*x-c(1)).^2)/(m-2);
sm2 = sres2/D;
sc2= sres2*((m^-1)+mean(x)^2/D);
p = (1-0.95)/2;
tst= tinv(p,m-2); %Valor de la distribucion t de student con 95%

dc=[tst*sqrt(sc2),tst*sqrt(sm2)];
end 

%Calculo del residuo cuadrado:


r2=(sum((x-X).*(y-Y))/(sqrt(sum((X-x).^2))*(sqrt(sum((Y-y).^2)))))^2;

%puntos a interpolar
y1=zeros(1,length(x1));
for k=0:n
y1=y1+c(k+1).*x1.^k;
end