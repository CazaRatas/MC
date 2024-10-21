%multivariable newton
clear
clc

n = input('Introduce la cantidad de variables: ');
num = 100;
er = 10^-10;
%Declaracion de variables D = vector D de incognitas
D = cell(1, n);
for i = 1: 1 : n
    D{i} = sprintf('x%d', i);
end

%varStr guardaremos todas las variabes para transformarlas en string
varStr = '';
for i = 1 : 1 : n
    varStr = [varStr, D{i}];
    if i < n
        varStr = [varStr, ', '];
    end
end

%Creacion de funciones anonimas
f = cell(1, n);
fprintf('Introduce las funciones con  %s.\n', varStr);
for i = 1 : 1 : n
    expr = input(sprintf('Función %d: ', i), 's');
    funAno = ['@(' varStr ') ' expr];
    f{i} = str2func(funAno);
end

% Almacenar los valores de la primera Aproximacion
%vX = valores de x del diagrama
disp('Introduce la primera aproximacion: ');
vX = zeros(1, n);
for i = 1:n
    prompt = sprintf('Valor para %s: ', D{i});
    entrada = input(prompt);
    vX(i) = entrada;
end

hh = 1;
l = 0;
Y = zeros(1,n);

while (l == 0)
    % Evaluamos la funcion en los puntos para calcular R(x)
    R = zeros(1, n);
    argumento = num2cell(vX);
    for i = 1:n
        R(i) = -f{i}(argumento{:});
    end

    % Matriz Jacobiana con aproximacion infinitesimal
    h = 10^-10;
    J = zeros(n,n);

    for i = 1 : 1 : n
        for j = 1: 1 : n
            xP = vX;
            xM = vX;
            xP(j) = xP(j) + h;
            xM(j) = xM(j) - h;
            argP = num2cell(xP);
            argM = num2cell(xM);
            fP = f{i}(argP{:});
            fM = f{i}(argM{:});
            J(i,j) = (fP - fM) / (2 * h);
        end
    end

    %Metodo de Gauss Jordan
    for i = 1 : 1 : n
    p = J(i,i);
    for j = i : 1 : n
        J(i,j) = J(i,j) / p;
    end
    R(1,i) = R(1,i) / p;
    j = 1;
    while (j <= n)
        if ((j ~= n) || (j ~= i))
        if (i ~= j)
            z = -J(j,i);
            for k = i : 1 : n
            J(j,k) = J(j,k) + z*J(i,k);
            end
            R(1,j) = R(1,j) + z * R(1,i);
        end
        end
        j = j + 1;
    end
    end

    for i = 1 : 1 : n
        Y(1,i) = vX(1,i);
        vX(1,i) = vX(1,i) + R(1,i);
    end

    maxV = max(abs(R));

    for i = 2 : 1 : n
        if(R(1,i) > maxV)
            maxV = R(1,i);
        end
    end

    if(maxV < er)
        l = 1;
        disp('Conjunto solucion...');
        for i = 1 : 1 : n
            fprintf('%s = %.10f\n', D{i}, vX(i));
        end
    else
        if(hh < num)
            hh = hh + 1;
        else
            l = 1;
            disp('No converge ...');
            disp(Y);
            disp(vX);
        end
    end
end
