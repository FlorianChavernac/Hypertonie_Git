import serial
import csv
import os

serial_port = "COM3"  # Remplacez "x" par le numéro de votre port série

current_dir = os.path.dirname(__file__)  # Obtient le répertoire actuel du script
data_dir = os.path.join(current_dir, "../data/")  # Chemin relatif vers le répertoire data
file_path = os.path.join(data_dir, "data_from_arduino.csv")  # Chemin complet vers le fichier CSV

header = [
    "Calibration_1", "AccX_1", "AccY_1", "AccZ_1", "Roll_1", "Pitch_1", "Yaw_1", "QuatW_1", "QuatX_1", "QuatY_1", "QuatZ_1",
    "Calibration_2", "AccX_2", "AccY_2", "AccZ_2", "Roll_2", "Pitch_2", "Yaw_2", "QuatW_2", "QuatX_2", "QuatY_2", "QuatZ_2"
]

with open(file_path, mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)

    ser = serial.Serial(serial_port, 115200, timeout=1)

    while True:
        line = ser.readline().decode("utf-8").strip()
        if line.startswith("Sensor_1"):
            print(line)
            data = line.split(',')
            values = [float(val.split(':')[1]) for val in data[1:]]
            writer.writerow(values)
        else:
            continue
