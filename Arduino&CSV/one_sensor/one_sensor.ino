#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

// Définir le capteur BNO055
Adafruit_BNO055 bno = Adafruit_BNO055();

void setup() {
  Serial.begin(115200);

  // Initialiser le capteur BNO055
  if (!bno.begin())
  {
    Serial.println("Erreur d'initialisation du BNO055");
    while (1);
  }
}

void loop() {
  // Lire les données du capteur BNO055
  sensors_event_t event;
  bno.getEvent(&event);

  // Envoyer les données via le port série
  Serial.print("AccX:"); Serial.print(event.acceleration.x);
  Serial.print(",AccY:"); Serial.print(event.acceleration.y);
  Serial.print(",AccZ:"); Serial.print(event.acceleration.z);
  Serial.print(",Roll:"); Serial.print(event.orientation.x);
  Serial.print(",Pitch:"); Serial.print(event.orientation.y);
  Serial.print(",Yaw:"); Serial.print(event.orientation.z);

  // Envoyer les données du quaternion
  imu::Quaternion quat = bno.getQuat();
  Serial.print(",QuatW:"); Serial.print(quat.w());
  Serial.print(",QuatX:"); Serial.print(quat.x());
  Serial.print(",QuatY:"); Serial.print(quat.y());
  Serial.print(",QuatZ:"); Serial.println(quat.z());

  // Attente courte
  delay(100);
}
