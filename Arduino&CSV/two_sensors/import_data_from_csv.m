function result = import_data_from_csv(fichier)
    cd("../data");

    % Importation des données à partir du fichier CSV ;data_from_arduino.csv
    data = readtable(fichier); % Charge toutes les données du fichier CSV
    data = table2array(data); % Convertit les données en tableau

    % Accéder à des colonnes spécifiques (par exemple, colonnes 2 à 11)
    sensor_1_data = data(:, 1:11); % Données du capteur 1
    sensor_2_data = data(:, 12:22); % Données du capteur 2

    % Appliquer un filtre moyenneur sur les données d'accélération de chaque capteur
    window_size = 5; % Taille de la fenêtre du filtre moyenneur (vous pouvez ajuster cette valeur)
    sensor_1_acc_filtered = movmean(sensor_1_data(:, 2:4), window_size);
    sensor_2_acc_filtered = movmean(sensor_2_data(:, 2:4), window_size);

    % Création des variables de sortie avec les données filtrées
    result.sensor_1.cal = sensor_1_data(:, 1);
    result.sensor_1.acc = sensor_1_acc_filtered;
    result.sensor_1.euler = sensor_1_data(:, 5:7);
    result.sensor_1.quat = quaternion(sensor_1_data(:, 8:11));

    result.sensor_2.cal = sensor_2_data(:, 1);
    result.sensor_2.acc = sensor_2_acc_filtered;
    result.sensor_2.euler = sensor_2_data(:, 5:7);
    result.sensor_2.quat = quaternion(sensor_2_data(:, 8:11));

    result.time = data(:, 23);

    cd("../two_sensors");
end
