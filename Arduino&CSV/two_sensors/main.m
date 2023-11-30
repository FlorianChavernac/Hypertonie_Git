[donnees] = import_data_from_csv("data_from_arduino.csv");
[angles] = calculate_angles(donnees)
%[time]= calculate_catch_time(donnees)

subplot(3,1,1)
plot(rad2deg(angles(:,1)))
title("Angle 1")
subplot(3,1,2)
plot(rad2deg(angles(:,2)))
title("Angle 2")
subplot(3,1,3)
plot(rad2deg(angles(:,3)))
title("Angle 3")


