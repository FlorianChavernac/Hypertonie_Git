function [angle_max_deceleration_x, max_amplitude]=detect_catch(donnees, angles)
    %Déterminer l'indice où on observe la décélération la plus forte
    %donnees.sensor_2.acc() est un tableau de 3 colonnes (x,y,z) et de n lignes qui contient les données d'accélération
    deceleration_sensor_2 = -1.*(donnees.sensor_2.acc);
    %% Trouver l'instant où la pente est la plus forte
    %On calcule la pente entre chaque point de la courbe
    pente = diff(deceleration_sensor_2);
    %On calcule la norme de la pente
    %%norme_pente = sqrt(pente(:,1).^2 + pente(:,2).^2 + pente(:,3).^2)
    %On cherche l'indice où la norme de la pente est la plus forte
    [~, indice_max_deceleration_x] = max(pente(:,1));

    %%Chercher la valeur de l'angle correspondant pour cet indice 
    angle_max_deceleration_x = (angles(indice_max_deceleration_x, 1)+180);
    max_amplitude = max((angles(indice_max_deceleration_x:end, 1))+180);


    
end
