function [M,DM] = Derivadas_parciales(Variables, Datos, Deltas,F)

% DADA UNA CELDA {} de variables, unos datos e incertidumbres correspondientes, 
% y un handle-funcion F que se corresponde al valor que queremos obtener se
% determina el valor de la medida derivada y de la incertidumbre asociada



Variables2 = sym(Variables); 


p = F(Variables2); %VALOR SIMBOLICO DE RESULTADO
Parciales=[]; %Vector Donde iran Nustras variables


for i=1:length(Variables2)  %Crea vector de expresiones de derivadas evaluadas para los datos dados 
    Parciales(i)= double(subs(diff(p, Variables2(i)),Variables2,Datos));
end 

DM= sqrt(sum((Parciales.*Deltas).^2)); %Evaluamos la raiz de la suma cuadratica de la multiplicacion de nuetras derivadas multiplicadas por las incertidumbres de cada medida 
M = double(subs(p,Variables2,Datos)); %Evaluamos el valor de la función para los datos.



end

