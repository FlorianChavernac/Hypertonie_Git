function [angles] = calculate_angles(donnees)
    quat_angle= conj(donnees.sensor_2.quat) .* donnees.sensor_1.quat;
    angles = rad2deg(euler ( quat_angle,'XYZ','frame') ) ;
    
disp(quat_angle)

    
