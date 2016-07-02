GWindow windowCharging;
int stateElaborating;
int stateWorking;
//int max = 480;
public void createWindow(){
  windowCharging = GWindow.getWindow(this, "charging...", 0, 0, 540, 190, JAVA2D);
  windowCharging.noLoop();
  windowCharging.addDrawHandler(this, "window_draw");
  windowCharging.loop();
  
  stateElaborating = 0;
  stateWorking = 0;
}

public void window_draw(PApplet appc, GWinData data) {
  appc.rect(30, 20, 480, 55);
  for(int i = 0; i<stateElaborating;i++){
    int x = 30 + i;
    int y = 20;
    appc.line(x, y, x, y+55);
  }
   appc.rect(30, 100, 480, 55);
  for(int i = 0; i<stateWorking;i++){
    int x = 30 + i;
    int y = 100;
    appc.line(x, y, x, y+55);
  }
}

public void testCharging(){
  createWindow();
  for(int i=0;i<48;i++){
    try{
      Thread.sleep(80);
    }
    catch(Exception e){
    }
    stateElaborating+=10;
  }
  
  for(int i=0;i<48;i++){
    try{
      Thread.sleep(80);
    }
    catch(Exception e){
    }
    stateWorking+=10;
  }
  windowCharging.setVisible(false);
}