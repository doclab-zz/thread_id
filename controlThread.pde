extern void magneticControlHandler( );
extern void thermalControlHandler();
extern void pumpControlHandler();
extern void opticalControlHandler();

void controlThread(int idNumber){

// Print the status message:
  Serial.println(" ");
  Serial.println("---------------------------->");
  Serial.print("ControlThread ");
  Serial.print(idNumber);
  Serial.println(" is called.");
  
  
  switch (idNumber)
  {
   case 1:
    magneticControlHandler( );
   break;
    
   case 2:
    thermalControlHandler();
   break;

   case 3:
    pumpControlHandler();
   break;
   
   case 4:
    opticalControlHandler();
   break;
   
   default: 
   break;
  }
 
}


