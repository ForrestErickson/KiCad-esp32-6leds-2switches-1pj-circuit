#define BAUD_DFPLAYER 9600

#include <DFRobotDFPlayerMini.h>

HardwareSerial mySerial1(2);  // Use UART2
DFRobotDFPlayerMini dfPlayer;

const int trac1 = 1;
const int trac2 = 2;


void DFP_Test() {

  // Check if the module is responding and if the SD card is found
  Serial.println(F("Initializing DFPlayer module. UART2 Begin..."));

  mySerial1.begin(BAUD_DFPLAYER, SERIAL_8N1, 16, 17);
  while (!mySerial1) {
    ;  // wait for DFPlayer serial port to connect.
  }
  // Essential Initialize of DFPlayer Mini
  Serial.println("DFPlayer begin with ACK and Reset");
  dfPlayer.begin(mySerial1, true, true);  // (Stream &stream, bool isACK, bool doReset)

  //  delay(30);
  //  Serial.println("Reset DFPlayer.");
  dfPlayer.reset();
  delay(3000);
  Serial.println("Begin DFPlayer again.");
  if (!dfPlayer.begin(mySerial1, true, true)) {
    Serial.println("DFPlayer Mini not detected or not working.");
    while (true)
      ;  // Stop execution
  }
  Serial.println("DFPlayer Mini detected!");

  // delay(3000);  //Required for volum to set
 
  // dfPlayer.setTimeOut(500);  // Set serial communictaion time out 500ms
  // delay(100);
}


void DFPlayerSplash(void) {


 //  // Set volume (0 to 30)
  //  dfPlayer.volume(30);       // Set initial volume max
  dfPlayer.volume(5);  // Set initial volume low
  delay(3000);
  Serial.print("Volume is set to: ");
  // digitalWrite(LED_D6, HIGH);             //Start of volume read.
  Serial.println(dfPlayer.readVolume());  //Causes program lock up
  // digitalWrite(LED_D6, LOW);              //End of volume read.
  Serial.println("Play a track");
  dfPlayer.play(4);



}




