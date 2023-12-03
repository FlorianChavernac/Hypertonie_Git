[donnees] = import_data_from_csv("data_from_arduino.csv");
[angles] = calculate_angles(donnees);
figure(1)
subplot(3,1,1)
plot(donnees.time, angles(:,1)+180)
title("Angle 1")
xlabel("Temps (s)")
ylabel("Angle (degrés)")
subplot(3,1,2)
plot(donnees.time, angles(:,2))
title("Angle 2")
subplot(3,1,3)
plot(donnees.time, angles(:,3))
title("Angle 3")


figure(2)
subplot(3,2,1)
plot(donnees.time, donnees.sensor_2.acc(:,1))
subplot(3,2,2)
plot(donnees.time, donnees.sensor_2.acc(:,2))
subplot(3,2,3)
plot(donnees.time, donnees.sensor_2.acc(:,3))
subplot(3,2,4)
plot(donnees.time, donnees.sensor_1.acc(:,1))
subplot(3,2,5)
plot(donnees.time, donnees.sensor_1.acc(:,2))
subplot(3,2,6)
plot(donnees.time, donnees.sensor_1.acc(:,3))

[angle_catch, max_amplitude]=detect_catch(donnees, angles);

