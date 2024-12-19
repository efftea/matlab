x1 = linspace(-1, 1, 10)
x2 = linspace(-1, 1, 10)

[X1, X2] = meshgrid(x1, x2);

Y = 2 * (X1 - 1).^2 + (1 + X2.^2)

dlmwrite('testing_data.dat', [X1(:), X2(:), Y(:)], 'delimiter', '\t');