import serial
import csv

serial_port = "COMx"  # Remplacez "x" par le numéro de votre port série

ser = serial.Serial(serial_port, 115200, timeout=1)

desktop_path = "C:\\Users\\hamza\\OneDrive\\Bureau\\"
file_path = desktop_path + "data_from_arduino.csv"

with open(file_path, mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Sensor", "AccX", "AccY", "AccZ", "Roll", "Pitch", "Yaw", "QuatW", "QuatX", "QuatY", "QuatZ"])

    while True:
        line = ser.readline().decode("utf-8").strip()
        if line:
            data = line.split(',')
            sensor = data[0]
            values = [float(val) for val in data[1:]]
            writer.writerow([sensor] + values)
