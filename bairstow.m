%Metodo bairstow
clc
clear

n = input("Ingrese el grado del polinomio: ");
er = 10^-10;
num = 100;
a = zeros(n + 1,1);

for i = 1 : 1 : n + 1
    a(i) = input(' ');

end

u = input("Ingrese: u = ");
v = input("Ingrese: v = ");
k = 1;
j = 1;
m = n;
b = zeros(n + 1,1);
c = zeros(n,1);
x = zeros(n,1);

while (n > 2)
    if (k > num)
        u = input("Otro u = ");
        v = input("Otro v = ");
        k = 1;
    end

    b(2) = 0;
    b(1) = 0;

    for i = 3: 1 : n + 3
        b(i) = a(i - 2) + u * b(i - 1) + v *b(i - 2);
    end

    c(2)=0;
    c(1)=0;

    for i = 3: 1 : n + 2
        c(i) = b(i) + u * c(i - 1) + v * c(i - 2);
    end

    d = (b(n + 3) * c(n) - b(n + 2) * c(n + 1)) / (c(n + 1) * c(n + 1) - c(n + 2) * c(n));
    e =(b(n + 2) * c(n + 2) - b(n + 3) * c(n + 1)) / (c(n + 1) * c(n + 1) - c(n + 2) * c(n));
    u = u + d;

   v = v + e;

   if (abs(d) < er) && (abs(e) < er)
        x(j) = (u + sqrt(u.^2 - 4 * (-v))) / 2;
        x(j + 1) = (u - sqrt(u.^2 - 4 * (-v))) / 2;
        j = j + 2;
        n = n - 2;

        for i = 1 : 1 : n + 1
            a(i) = b(i + 2);
        end

        k = 1;
        u = input("Intente u = ");
        v = input("Intente v = ");
    else
        k = k + 1;
    end
end

if (n > 1)
    w = a(1);
    u = a(2);
    v = a(3);
    x(j) = (-1*u + sqrt(u.^2 - 4*(w)(v))) / (2(w));
    x(j + 1) = (-1 * u - sqrt(u.^2 - 4 * (w)(v))) / (2(w));
else
    if (n > 0)
        x(j)=-(b(4) / b(3));
    end
end

disp("Las raices son: ");
for i = 1 : 1 :m
    R(i) = x(i);
end
disp(R);
