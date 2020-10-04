// Created in 2017/4
// B.Sc. Senior Project
// By Sondos A. Alshami
// Telecommunication Engineering 
// Lebanese International University
#define SERIAL_BUFFER_SIZE 1000
int led=7;
int timeDelay=6;
String bufferA;
int m=14;



void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(led,OUTPUT);

}
void sendData(String x)
{
 //digitalWrite (led,0);
//delay(timeDelay);
for (int i=0;i<x.length();i++){
 if (x.charAt(i)=='1') digitalWrite(led,1);
else 
digitalWrite(led,0);

delay(timeDelay);
if (i==27||i==55){  //||i==((6*m-1))||i==((8*m-1))||i==((10*m-1))||i==((12*m-1))||i==((14*m-1))||i==((2*m-1))||
digitalWrite(led,1);
delay(timeDelay);
digitalWrite(led,1);
delay(timeDelay);
digitalWrite(led,1);
delay(timeDelay);
//digitalWrite(led,1);
//delay(timeDelay);
digitalWrite(led,0);
delay(500);

}}
digitalWrite(led,1);
delay(timeDelay);
digitalWrite(led,1);
delay(timeDelay);
digitalWrite(led,1);
delay(timeDelay);
//digitalWrite(led,1);
//delay(timeDelay);
digitalWrite(led,0);
delay(timeDelay);
}
void loop() {
  // put your main code here, to run repeatedly:
if(Serial.available()>0){
 String bufferA=Serial.readString();
sendData(bufferA); 
}
} 
