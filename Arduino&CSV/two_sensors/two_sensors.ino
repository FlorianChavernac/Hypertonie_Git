#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

// Définir les capteurs BNO055
Adafruit_BNO055 bno1 = Adafruit_BNO055(0, 0x28);  // Premier capteur à l'adresse 0x28
Adafruit_BNO055 bno2 = Adafruit_BNO055(1, 0x29);  // Deuxième capteur à l'adresse 0x29

void setup() {
  Serial.begin(115200);

  // Initialiser les capteurs BNO055
  if (!bno1.begin())
  {
    Serial.println("Erreur d'initialisation du BNO055 1");
    while (1);
  }

  if (!bno2.begin())
  {
    Serial.println("Erreur d'initialisation du BNO055 2");
    while (1);
  }
}

void loop() {
  // Lire les données du premier capteur BNO055
  sensors_event_t event1;
  bno1.getEvent(&event1);
  uint8_t system, gyro, accel, mag;
  system = gyro = accel = mag = 0; 
  bno1.getCalibration(&system, &gyro, &accel, &mag);

  // Envoyer les données du premier capteur via le port série
  Serial.print("Sensor_1");
  Serial.print(",Calibration:"); Serial.print(system, DEC);
  Serial.print(",AccX:");  Serial.print(event1.acceleration.x);
  Serial.print(",AccY:"); Serial.print(event1.acceleration.y);
  Serial.print(",AccZ:");  Serial.print(event1.acceleration.z);
  Serial.print(",Roll:");  Serial.print(event1.orientation.x);
  Serial.print(",Pitch:"); Serial.print(event1.orientation.y);
  Serial.print(",Yaw:");   Serial.print(event1.orientation.z);

  // Envoyer les données du quaternion
  imu::Quaternion quat = bno1.getQuat();
  Serial.print(",QuatW:"); Serial.print(quat.w());
  Serial.print(",QuatX:"); Serial.print(quat.x());
  Serial.print(",QuatY:"); Serial.print(quat.y());
  Serial.print(",QuatZ:"); Serial.print(quat.z());

  // Lire les données du deuxième capteur BNO055
  sensors_event_t event2;
  bno2.getEvent(&event2);
  system = gyro = accel = mag = 0;
  bno2.getCalibration(&system, &gyro, &accel, &mag);

  // Envoyer les données du deuxième capteur via le port série
  Serial.print(",Calibration:"); Serial.print(system, DEC);
  Serial.print(",AccX:");  Serial.print(event2.acceleration.x);
  Serial.print(",AccY:"); Serial.print(event2.acceleration.y);
  Serial.print(",AccZ:");  Serial.print(event2.acceleration.z);
  Serial.print(",Roll:");  Serial.print(event2.orientation.x);
  Serial.print(",Pitch:"); Serial.print(event2.orientation.y);
  Serial.print(",Yaw:");   Serial.print(event2.orientation.z);

  // Envoyer les données du quaternion
  quat = bno2.getQuat();
  Serial.print(",QuatW:"); Serial.print(quat.w());
  Serial.print(",QuatX:"); Serial.print(quat.x());
  Serial.print(",QuatY:"); Serial.print(quat.y());
  Serial.print(",QuatZ:"); Serial.println(quat.z());

  // Attente correspondante à une fréquence de 100 Hz
  delay(10);
}
