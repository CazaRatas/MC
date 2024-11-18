%Metodo del trapecio

clc
clear
n = 500;
funcion = input('Introduce la funcion: ', 's');
fun = ['@(x) ', funcion];
f = str2func(fun);

x(1) = input('Ingresar el limite inferior de la integral: ');
x(n+1) = input('Ingresar el limite superior de la integral:  ');

h = (x(n+1) - x(1))/n;
S = 0;

for i = 2 : 1 : n
    x(i) = x(1) + (i - 1)*h;
    S = S + f(x(i));
end

I = h/2*(2*S + f(x(1))+f(x(n)));
disp(['El valor aproximado de la integral es: ', num2str(I)]);
