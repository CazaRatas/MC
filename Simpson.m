% Metodo de Simpson 1/3
clc
clear
n = 500;
funcion = input('Introduce la funcion: ', 's');
fun = ['@(x) ', funcion];
f = str2func(fun);
x(1) = input('Ingresar el limite inferior: ');
x(n + 1) = input('Ingresar el limite superior: ');

h = (x(n+1) - x(1))/n;

S1 = 0;
S2 = 0;

for i = 2 : 1 : n
    x(i) = x(1) + (i - 1)*h;
    if(0 == mod(i+1,2))
        S2 = S2 + f(x(i));
    else
        S1 = S1 + f(x(i));
    end
end

I = h/3*(f(x(1)) + 4 * S1+ 2 * S2 + f(x(n)));
disp(['El valor aproximado de la integral es: ', num2str(I)]);

