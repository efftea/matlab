x1 = (0: 0.1 : 8);
x2 = (0: 0.1 : 8);
[X, Y] = meshgrid(x1, x2);
Z = min(trapmf(X, [1 2 4 6]), trimf(Y, [2 3 4]));
plot3(X, Y, Z)