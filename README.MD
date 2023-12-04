# Project using IMU to mesure the angle of an articulation

## Procedure to run the project
Use the files present in the folder `Arduino&CSV` to run the project. The file `Arduino&CSV.ino` is the code to upload on the Arduino. The file `script_two_sensors.py` is the code to run on the computer. The file `script_two_sensors.py` will create a CSV file with the data from the Arduino.
When the acquisition is done, use the file `main.m` to plot the data.

## Prerequisites
- Arduino IDE
- Python 3
- MATLAB
- IMU's (BNO055)
- Arduino (Uno)
- Wires
- Breadboard
- Multiplexer (TCA9548A)

The python code uses the following libraries:
- pyserial
- time
- csv
