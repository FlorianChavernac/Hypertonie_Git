function time = time_seconds(data)
    % La fréquence d'échantillonnage est de 45 Hz
    sampling_frequency = 45; % Hz

    % Calculer le nombre total d'échantillons
    num_samples = size(data.sensor_2.acc, 1); % Vous pouvez utiliser n'importe quelle colonne de données, elles devraient avoir la même longueur

    % Calculer le temps total en secondes
    total_time = num_samples / sampling_frequency;

    % Générer un vecteur de temps en secondes
    time = linspace(0, total_time, num_samples)';
end
