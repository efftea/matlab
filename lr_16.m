w1 = [0.7 0.9; 
      0.5 0.2;];

w2 = [0.8 0.3;];

% Входные данные 
n = 2;
x1 = [1 2 3 4 5];
x2 = [6 7 8 9 10];

% Параметры обучения
epoch = 1;
ny = 0.5; 
learning_rate_decay = 0.95;
error_value = 0.0001;
previous_error = inf; 

sigmoid = @(x) 1 ./ (1 + exp(-x));

for j = 1 : epoch
    total_error = 0;
    for i = 1 : numel(x1)
        target = sqrt(x1(i) + x2(i)); 

        S1 = w1(1, 1) * x1(i) + w1(1, 2) * x2(i);
        S2 = w1(2, 1) * x1(i) + w1(2, 2) * x2(i);

        y1 = sigmoid(S1);
        y2 = sigmoid(S2);

        % Выходной слой
        s = w2(1, 1) * y1 + w2(1, 2) * y2;
        y = sigmoid(s);

        % Ошибка
        error = (y - target)^2; % This line was corrected to use element-wise power

        % Значение градиента выходного слоя
        grad_output = (y - target) * y * (1 - y);

        grad_output_21 = y1 * (1 - y1) * grad_output * w2(1, 1);
        grad_output_22 = y2 * (1 - y2) * grad_output * w2(1, 2);

        % Обновление весов
        w1(1, 1) = w1(1, 1) - ny * x1(i) * grad_output_21;
        w1(1, 2) = w1(1, 2) - ny * x2(i) * grad_output_22;

        w1(2, 1) = w1(2, 1) - ny * x1(i) * grad_output_21;
        w1(2, 2) = w1(2, 2) - ny * x2(i) * grad_output_22;

        w2(1, 1) = w2(1, 1) - ny * y1 * grad_output;
        w2(1, 2) = w2(1, 2) - ny * y2 * grad_output;

        total_error = total_error + error; 
    end

    total_error = total_error / numel(x1); 

     % Обновление скорости обучения
    if total_error >= previous_error
        ny = ny * learning_rate_decay;
    end

    previous_error = total_error;

    % Обновление скорости обучения
    if total_error >= previous_error
        ny = ny * learning_rage_decay;
    end

    previous_error = total_error;

    % Проверка на завершение обучения
    if total_error < error_value
        disp(['Эпоха ' num2str(j) ' значение ошибки ' num2str(total_error) ' обучение окончено']);
        break;
    else
        disp(['Эпоха ' num2str(j) ' значение ошибки ' num2str(total_error)]);
    end
end

disp('Обновленные веса w1: ');
disp(w1);
disp('Обновленные веса w2: ');
disp(w2);