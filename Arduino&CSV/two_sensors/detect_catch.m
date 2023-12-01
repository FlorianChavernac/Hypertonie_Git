function [angle_max_deceleration_x, max_amplitude]=detect_catch(donnees, angles)
    %Déterminer l'indice où on observe la décélération la plus forte
    %donnees.sensor_2.acc() est un tableau de 3 colonnes (x,y,z) et de n lignes qui contient les données d'accélération
    deceleration_sensor_2 = -1.*(donnees.sensor_2.acc)
    %% Trouver l'instant où la décélération sur l'axe x est maximale
    [~,indice_max_deceleration_x] = max(deceleration_sensor_2(:,1))
    %%Chercher la valeur de l'angle correspondant pour cet indice 
    angle_max_deceleration_x = rad2deg(angles(indice_max_deceleration_x))
    max_amplitude = max(rad2deg(angles(indice_max_deceleration_x:end, 2))+180)


    
end
