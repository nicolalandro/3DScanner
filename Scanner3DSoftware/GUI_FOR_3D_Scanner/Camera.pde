GWindow windowCamera;
public void createWindowCamera(){
  windowCamera = GWindow.getWindow(this, "camera", 0, 0, width, height, JAVA2D);
  windowCamera.noLoop();
  windowCamera.addDrawHandler(this, "window_draw_camera");
  windowCamera.loop();
}

public void window_draw_camera(PApplet appc, GWinData data) {
  appc.background(230);
  if (cam.available() == true) {
    cam.read();
  }
  appc.image(cam, 0, 0, width,height);
 }