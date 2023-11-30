# pip install pyserial
import serial
import csv
import os

serial_port = "COM3"  # Remplacez "x" par le numéro de votre port série


ser = serial.Serial(serial_port, 115200, timeout=1)


#desktop_path = "C:\\Users\\hamza\\OneDrive\\Bureau\\"
current_dir = os.path.dirname(__file__)  # Obtient le répertoire actuel du script
data_dir = os.path.join(current_dir, "../data/")  # Chemin relatif vers le répertoire data
file_path = os.path.join(data_dir, "data_from_arduino.csv")  # Chemin complet vers le fichier CSV

with open(file_path, mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["AccX", "AccY", "AccZ", "Roll", "Pitch", "Yaw", "QuatW", "QuatX", "QuatY", "QuatZ"])

    while True:
        line = ser.readline().decode("utf-8").strip() # Lit une ligne du port série et la décode en UTF-8
        if line:
            data = line.split(',') # Sépare les données en fonction des virgules
            writer.writerow([float(val.split(':')[1]) for val in data])

