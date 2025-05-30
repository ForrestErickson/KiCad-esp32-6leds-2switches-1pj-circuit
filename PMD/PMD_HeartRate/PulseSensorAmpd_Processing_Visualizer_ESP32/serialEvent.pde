



void serialEvent(Serial port){
try{
   String inData = port.readStringUntil('\n');
   inData = trim(inData);                 // cut off white space (carriage return)
   println(inData);

  if (inData.charAt(0) == 'S'){           // leading 'S' means Pulse Sensor data packet
     inData = inData.substring(1);        // cut off the leading 'S'
//     Sensor = int(inData);                // convert the string to usable int
     Sensor = int(inData)/4;                // convert the string to usable int, Div by 4 because ESP32
   }
   if (inData.charAt(0) == 'B'){          // leading 'B' for BPM data
     inData = inData.substring(1);        // cut off the leading 'B'
     BPM = int(inData);                   // convert the string to usable int
     beat = true;                         // set beat flag to advance heart rate graph
     heart = 20;                          // begin heart image 'swell' timer
   }
   if (inData.charAt(0) == 'Q'){            // leading 'Q' means IBI data
     inData = inData.substring(1);        // cut off the leading 'Q'
     IBI = int(inData);                   // convert the string to usable int
   }
} catch(Exception e) {
  println(e.toString());
}

}// END OF SERIAL EVENT
