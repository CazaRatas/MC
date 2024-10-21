%Punto Fijo

clear
clc

x(1) = input('Valor incial: ');
e = 10^-10;
num = 100;

funcion = input('Ingrese la funcion: ', 's');

fun = ['@(x) ', funcion];
fun
fr = str2func(fun);

i = 2;
k = 0;
while (k == 0)
   x(i) = fr(x(i-1));
   if (abs(x(i) - x(i - 1)) < e)
     r = x(i);
     r
     k = 1;
   else
     if(i < num)
      i = i+1;
     else
      disp('No existe...');
      k = 1;
     end
   end
end


