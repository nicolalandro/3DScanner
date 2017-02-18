// Need G4P library
import g4p_controls.*;
import processing.video.*;
import processing.serial.*;
import javax.swing.JOptionPane; 

PApplet wantedThis;
Serial arduinoPort;
Capture cam;
String[] cameras;

public void writeList(String name, String[] list){
   PrintWriter out = createWriter("data/"+name);
   for (int i = 0; i < list.length; i++) {
     out.println(list[i]);
    }
   out.flush();
   out.close();
}

public Serial createArduino(int index){
  return new Serial(wantedThis, Serial.list()[index],9600); //Non va perche vuole la PPAplet non "this"
}

public void setup(){
  wantedThis = this;
  arduinoPort = new Serial(this, Serial.list()[(Serial.list()).length-1],9600);
  //obtain camera list
  cameras = Capture.list();
  //write list
  writeList("list_242425", Serial.list());
  writeList("list_818250", Capture.list());
  
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}


public void draw(){
  background(230);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){
  cam = new Capture(this, cameras[0]);
  cam.start();
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    textfield1.setText(selection.getAbsolutePath());
  }
}

public void acquire(){
  arduinoPort.write(1); //accendi il laser
  for(int j=0;j<3;j++){
    for(int i=0;i<48;i++){
      stateElaborating+=10; //aggiorna barra di caricamento
      saveImageFromCam(textfield1.getText()+"/image"+i+".jpg");
      arduinoPort.write(2); // uno step per il motore stepper
      try{
        Thread.sleep(80);
      }catch(InterruptedException e){
      }
    }
  }
  arduinoPort.write(0); //spegni il laser
}
public void work(){
  for(int i=0;i<48;i++){
    stateWorking+=10; //aggiorna la barra di caricamento
    PImage img = loadImageFromUrl(textfield1.getText()+"/image"+i+".jpg");
    //create3DfromImage(img);
  }
  windowCharging.setVisible(false);
}