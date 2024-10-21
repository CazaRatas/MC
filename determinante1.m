%Determinante de una matriz superior

clear
clc

disp('------------------------------------');
n = input('Ingrese el orden de la matriz: ');

for i = 1 : 1 : n
    for j = 1 : 1 : n
        A(i,j) = input(' ');
    end
end

d = 1;
cambio = 0;
for i = 1 : 1 : n-1
  %Cambio de filas
  if (A(i,i) == 0)
    AUX = A(i,:);
    cen = 0;
    for j = i+1 : 1 : n
      if(A(j,i) ~= 0 & cen == 0)
        A(i,:) = A(j,:);
        A(j,:) = AUX;
        cen = 1;
        cambio =cambio + 1;
      else
        cen = 0;
      end
    end
  end

    d = d * A(i,i);
    p = A(i,i);
    for j = 1 : 1 : n
        A(i,j) = A(i,j) / p;
    end
    for j = i + 1 : 1 : n
        f = -A(j,i);
        for k = i : 1 : n
            A(j,k) = A(j,k) + f * A(i,k);
        end
    end
end
d = d * A(n,n);

if(mod(cambio,2)~=0)
  d = -d
else
  d
end



%{
Determinante triangulacion inferior

clear
clc

disp('------------------------------------');
n = input('Ingrese el orden de la matriz: ');

for i = 1 : 1 : n
    for j = 1 : 1 : n
        A(i,j) = input(' ');
    end
end

d = 1;

for i = n : -1 : 2
    d = d * A(i,i);
    p = A(i,i);
    for j = 1 : 1 : n
        A(i,j) = A(i,j) / p;
    end
    for j = i - 1 : -1 : 1
        f = -A(j,i);
        for k = 1 : 1 : n
            A(j,k) = A(j,k) + f * A(i,k);
        end
    end
end

d = d * A(1,1);
d
}%

