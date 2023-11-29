%% Create Connection to two BNO055 Sensor trhough Arduino Uno
arduinoObj = arduino('COM3', 'Uno', 'Libraries', 'I2C');
bno1 = bno055(arduinoObj, 'I2CAddress', '0x28', 'OperatingMode', 'ndof', 'OutputFormat', 'matrix', 'SamplesPerRead',50);
bno2 = bno055(arduinoObj, 'I2CAddress', '0x29', 'OperatingMode', 'ndof', 'OutputFormat', 'matrix', 'SamplesPerRead',50);

%% Calibrate BNO055 Sensor
% Accelerometer calibration flag
accCalib = 0; 
% Gyroscope calibration flag
gyrCalib = 0; 
% Magnetometer calibration flag
magCalib = 0; 
fprintf('Calibrating the BNO055 1 sensor . . . \n');
% while(prod([accCalib, gyrCalib, magCalib]) ~= 1)
%     if strcmpi(bno1.readCalibrationStatus.Accelerometer, "full") && isequal(accCalib, 0)
%         accCalib = 1;
%         fprintf('Accelerometer is calibrated! . . .\n');
%     end
%     if strcmpi(bno1.readCalibrationStatus.Gyroscope, "full") && isequal(gyrCalib, 0)
%         gyrCalib = 1;
%         fprintf('Gyroscope is calibrated! . . .\n');
%     end
%     if(strcmpi(bno1.readCalibrationStatus.Magnetometer, "full"))&& isequal(magCalib, 0)
%         magCalib = 1;
%         fprintf('Magnetometer is calibrated! . . .\n');
%     end
% end
% fprintf('BNO055 1 sensor is fully calibrated!\n');
% 
% % Accelerometer calibration flag
% accCalib = 0;
% % Gyroscope calibration flag
% gyrCalib = 0;
% % Magnetometer calibration flag
% magCalib = 0;
% fprintf('Calibrating the BNO055 2 sensor . . . \n');
% while(prod([accCalib, gyrCalib, magCalib]) ~= 1)
%     if strcmpi(bno2.readCalibrationStatus.Accelerometer, "full") && isequal(accCalib, 0)
%         accCalib = 1;
%         fprintf('Accelerometer is calibrated! . . .\n');
%     end
%     if strcmpi(bno2.readCalibrationStatus.Gyroscope, "full") && isequal(gyrCalib, 0)
%         gyrCalib = 1;
%         fprintf('Gyroscope is calibrated! . . .\n');
%     end
%     if(strcmpi(bno2.readCalibrationStatus.Magnetometer, "full"))&& isequal(magCalib, 0)
%         magCalib = 1;
%         fprintf('Magnetometer is calibrated! . . .\n');
%     end
% end
fprintf('BNO055 2 sensor is fully calibrated!\n');


%% Display a message to the user to indicate that he can start the experiment
fprintf('You can start the experiment now!\n');

%% Example Read and plot acceleration values from an BNO055 sensor from documentation
figure;
xlabel('Samples read');
ylabel('Acceleration (m/s^2)');
title ('Acceleration values from BNO055 sensor');
xval = animatedline('Color', 'r');
y_val = animatedline('Color','g');
z_val = animatedline('Color','b');
axis tight;
legend('Acceleration in X-axis','Acceleration in Y-axis',...
     'Acceleration in Z-axis');
   stop_time = 2; %  time in seconds
   count = 1;
   tic;
   while(toc <= stop_time)
     [accel,gyro,mag, orientation] = read(bno1);
     addpoints(x_val,count:(count+sensorObj.SamplesPerRead-1),accel(:,1));
     addpoints(y_val,count:(count+sensorObj.SamplesPerRead-1),accel(:,2));
     addpoints(z_val,count:(count+sensorObj.SamplesPerRead-1),accel(:,3));
     count = count + sensorObj.SamplesPerRead;
     drawnow limitrate;
     
   end

%% Matlab can only get the euler angles and not the quaternions
%  Peut être affiché les quat dans le serial monitor et les récupérer dans
%  matlab
clear;

