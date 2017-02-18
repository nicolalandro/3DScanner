#include <Stepper.h>
int steps = 1;

int in1Pin = 12;
int in2Pin = 11;
int in3Pin = 10;
int in4Pin = 9;
Stepper motor(1200, in1Pin, in2Pin, in3Pin, in4Pin);  //di solito 512 invecce che 1200

int led = 13;

void setup() {
  pinMode(in1Pin, OUTPUT);
  pinMode(in2Pin, OUTPUT);
  pinMode(in3Pin, OUTPUT);
  pinMode(in4Pin, OUTPUT);
  
  pinMode(led, OUTPUT);
  digitalWrite(led, LOW);
  
  Serial.begin(9600);
  
  motor.setSpeed(40);
}

// the loop function runs over and over again forever
void loop() {
  if (Serial.available()){
    String i = (String)Serial.read();
    if(i.equals("0")){
      digitalWrite(led, LOW);
    }
    else if(i.equals("1")){
      digitalWrite(led, HIGH);
    }
    else if(i.equals("2")){
      motor.step(steps);
    }
  }
}
