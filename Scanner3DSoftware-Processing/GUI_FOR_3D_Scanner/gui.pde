/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void dropListCamera_click1(GDropList source, GEvent event) { //_CODE_:dropListCamera:818250:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
  cam.stop();
  cam = new Capture(this, cameras[dropListCamera.getSelectedIndex()]);
  cam.start();
} //_CODE_:dropListCamera:818250:

public void dropListArduino(GDropList source, GEvent event) { //_CODE_:dropListArdu:242425:
  println("dropList2 - GDropList >> GEvent." + event + " @ " + millis());
  arduinoPort = new Serial(this, Serial.list()[dropListArdu.getSelectedIndex()],9600);
} //_CODE_:dropListArdu:242425:

public void buttonStart(GButton source, GEvent event) { //_CODE_:button1:731800:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  //saveImageFromCam(textfield1.getText()+"/file_name.jpg");
  //testCharging();
  try{
    arduinoPort = new Serial(this, Serial.list()[dropListArdu.getSelectedIndex()],9600);
    cam.stop();
    cam = new Capture(this, cameras[dropListCamera.getSelectedIndex()]);
    cam.start();
    createWindowCamera();
    
    createWindow();
    
    acquire();
    
    work();
  }
  catch(Exception e){
     JOptionPane.showMessageDialog(null, "Arduino or Camera are not set correctly", "Error", JOptionPane.ERROR_MESSAGE);  
  }
  
} //_CODE_:button1:731800:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:789372:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:789372:

public void buttonSelectFolder(GButton source, GEvent event) { //_CODE_:button2:824505:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  selectFolder("Select a file to process:", "fileSelected");
} //_CODE_:button2:824505:

public void buttonViewCamera(GButton source, GEvent event) { //_CODE_:button3:392787:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  createWindowCamera();
} //_CODE_:button3:392787:

public void buttonRefresh(GButton source, GEvent event) { //_CODE_:button4:448289:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  //obtain camera list
  cameras = Capture.list();
  //write list
  writeList("list_242425", Serial.list());
  writeList("list_818250", Capture.list());
  dropListArdu.setItems(loadStrings("list_242425"), 0);
  dropListCamera.setItems(loadStrings("list_818250"), 0);
} //_CODE_:button4:448289:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  dropListCamera = new GDropList(this, 103, 42, 368, 140, 6);
  dropListCamera.setItems(loadStrings("list_818250"), 0);
  dropListCamera.addEventHandler(this, "dropListCamera_click1");
  label2 = new GLabel(this, 10, 10, 80, 20);
  label2.setText("Arduino");
  label2.setOpaque(false);
  dropListArdu = new GDropList(this, 102, 10, 368, 140, 6);
  dropListArdu.setItems(loadStrings("list_242425"), 0);
  dropListArdu.addEventHandler(this, "dropListArduino");
  button1 = new GButton(this, 189, 276, 80, 30);
  button1.setText("Start");
  button1.addEventHandler(this, "buttonStart");
  textfield1 = new GTextField(this, 100, 77, 372, 30, G4P.SCROLLBARS_NONE);
  textfield1.setText("data");
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  button2 = new GButton(this, 11, 77, 80, 30);
  button2.setText("Select Folder");
  button2.addEventHandler(this, "buttonSelectFolder");
  button3 = new GButton(this, 11, 40, 80, 30);
  button3.setText("ViewCamera");
  button3.addEventHandler(this, "buttonViewCamera");
  button4 = new GButton(this, 189, 127, 80, 52);
  button4.setText("Research Arduino or Camera");
  button4.addEventHandler(this, "buttonRefresh");
}

// Variable declarations 
// autogenerated do not edit
GDropList dropListCamera; 
GLabel label2; 
GDropList dropListArdu; 
GButton button1; 
GTextField textfield1; 
GButton button2; 
GButton button3; 
GButton button4; 