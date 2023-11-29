#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

// Définir les capteurs BNO055
Adafruit_BNO055 bno1 = Adafruit_BNO055(0, 0x28);  // Premier capteur à l'adresse 0x28
Adafruit_BNO055 bno2 = Adafruit_BNO055(0, 0x29);  // Deuxième capteur à l'adresse 0x29

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

  // Envoyer les données du premier capteur via le port série
  Serial.print("1,");
  Serial.print(event1.acceleration.x);
  Serial.print(",");
  // ... (ajoutez les autres données du premier capteur)

  // Lire les données du deuxième capteur BNO055
  sensors_event_t event2;
  bno2.getEvent(&event2);

  // Envoyer les données du deuxième capteur via le port série
  Serial.print("2,");
  Serial.print(event2.acceleration.x);
  Serial.print(",");
  // ... (ajoutez les autres données du deuxième capteur)

  // Attente courte
  delay(100);
}
