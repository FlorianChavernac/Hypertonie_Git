function [time]=calculate_catch_time(donnees)
    %Déterminer l'indice où on observe la décélération la plus forte
    %donnees.sensor_2.acc() est un tableau de 3 colonnes (x,y,z) et de n lignes qui contient les données d'accélération

    %Trouver sur quelle composante (x,y,z) l'accélération est la plus forte 
    [max_acc,indice_max_acc]=max(donnees.sensor_2.acc());
    %Observer la décélération sur cette composante
    deceleration=diff(max_acc);
    %Trouver l'indice où la décélération est la plus forte
    [max_deceleration,indice_max_deceleration]=max(deceleration);
    %Trouver le temps où la décélération est la plus forte
    time=donnees.sensor_2.time(indice_max_deceleration);
end
