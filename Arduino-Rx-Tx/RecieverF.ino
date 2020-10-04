// Created in 2017/4
// B.Sc. Senior Project
// By Sondos A. Alshami
// Telecommunication Engineering 
// Lebanese International University
#define SERIAL_BUFFER_SIZE 1000

char bufferB[4];
String readData;
char bufferC='0';
int timeDelay=6;

boolean DataIsAvaliable =false;
int counter =0;

void setup() {
  // put your setup code here, to run once:
  pinMode(10,INPUT);
Serial.begin(9600);
}
void EmplyBuffer (){
 for(int i=0;i<4;i++)
bufferB[i]=0; 
}
void shifter(){
 bufferB[0]=bufferB[1];
bufferB[1]=bufferB[2];
bufferB[2]=bufferB[3];
bufferB[3]=0;
}

void loop() {
  // put your main code here, to run repeatedly:
if (digitalRead(10)==1){
 //Serial.println("data recieved");
DataIsAvaliable = true;
readData ="";
delay(timeDelay-1.12);//-1.12

while (DataIsAvaliable) {
 for (int i=0;i<4; i++){
  if (digitalRead(10)==1)
  bufferC='1';
  else
  bufferC='0';
  delay(timeDelay);
 //Serial.println(bufferC);
  
  if(i<=2){
    bufferB[i]=bufferC;}
   else if(i==3){
     bufferB[i]=bufferC;
      delayMicroseconds(5); 
      if(bufferB[0]=='1'&& bufferB[1]=='1' && bufferB[2]=='1'&&bufferB[3]=='0' )
      {
        DataIsAvaliable =false;
        
        Serial.print(readData);
        EmplyBuffer();
        break;
      }
      else {
        //Serial.println(String(bufferB));
        readData +=(String ) bufferB[0];
        shifter();
        i--;
    }
 } 
 
}
}}}
