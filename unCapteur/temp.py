import serial
import csv

serial_port = "COM10"  # Remplacez "x" par le numéro de votre port série


ser = serial.Serial(serial_port, 115200, timeout=1)

desktop_path = "C:\\Users\\hamza\\OneDrive\\Bureau\\"
file_path = desktop_path + "data_from_arduino.csv"

with open(file_path, mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["AccX", "AccY", "AccZ", "Roll", "Pitch", "Yaw", "QuatW", "QuatX", "QuatY", "QuatZ"])

    while True:
        line = ser.readline().decode("utf-8").strip()
        if line:
            data = line.split(',')
            writer.writerow([float(val.split(':')[1]) for val in data])

