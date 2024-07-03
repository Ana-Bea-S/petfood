#include "BluetoothSerial.h"
#include <LiquidCrystal_I2C.h>

#define MICROFONE 2 // LED VERMELHA
#define COMIDA 4 // LED AMARELA
#define AGUA 5 // LED AZUL
#define CAMERA 18 // LED BRANCO

BluetoothSerial SerialBT;

//Variáveis booleanas para verificação de estado de dispositivo
bool microfoneS = false;
bool cameraS = false;
bool sistemaConectado = false;

// Inicializa o LCD com 16 colunas e 2 linhas
LiquidCrystal_I2C lcd(0x27, 16, 2);  // Verifique o endereço do seu módulo LCD

void setup() {
  //Seta os dispositivos
  pinMode(MICROFONE, OUTPUT);
  pinMode(COMIDA, OUTPUT);
  pinMode(AGUA, OUTPUT);
  pinMode(CAMERA, OUTPUT);

  Serial.begin(115200);
  SerialBT.begin("ESP32_BT");
  Serial.println("O dispositivo está pronto para emparelhamento.");

  lcd.init();  // Inicializa o LCD
  lcd.backlight();
  
  delay(4000);  // Pequeno atraso após a inicialização do LCD
  lcd.clear();
}

void loop() {
  if (SerialBT.available()) {
    if (!sistemaConectado) {
      sistemaConectado = true;
      lcd.clear();
      lcd.print("Dispositivo");
      lcd.setCursor(0, 1);
      lcd.print("conectado!");
      delay(2000);
      lcd.clear();
    }

    char dado = SerialBT.read();
    switch (dado) {
      case 'A':
        microfoneS = !microfoneS;
        digitalWrite(MICROFONE, microfoneS ? HIGH : LOW);
        lcd.clear();
        lcd.print(microfoneS ? "Microfone Ligado!" : "Microfone Desligado!");
        Serial.println(microfoneS ? "Microfone Ligado!" : "Microfone Desligado!");
        break;
      case 'B':
        digitalWrite(COMIDA, HIGH);
        lcd.clear();
        lcd.print("Colocando comida!");
        Serial.println("Comida por 6 segundos");
        delay(6000);
        digitalWrite(COMIDA, LOW);
        lcd.clear();
        lcd.print("Comida colocada!");
        break;
      case 'C':
        digitalWrite(AGUA, HIGH);
        lcd.clear();
        lcd.print("Colocando agua!");
        Serial.println("Agua por 6 segundos");
        delay(6000);
        digitalWrite(AGUA, LOW);
        lcd.clear();
        lcd.print("Agua colocada!");
        break;
      case 'D':
        cameraS = !cameraS;
        digitalWrite(CAMERA, cameraS ? HIGH : LOW);
        lcd.clear();
        lcd.print(cameraS ? "Camera ligada!" : "Camera desligada!");//Confere o estado na camera e printa na tela
        Serial.println(cameraS ? "Camera Ligada!" : "Camera Desligada!");
        break;
    }
  }
  //Se o esp ainda não tiver sido conectado ao aparelho será printado no display uma mensagem
  else{
    lcd.setCursor(0, 0);
  lcd.print("Conecte o");
  lcd.setCursor(0, 1);
  lcd.print("dispositivo!");
  }
}
