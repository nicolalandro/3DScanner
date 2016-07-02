public void saveImageFromCam(String name){
  PImage still = createImage(cam.width, cam.height, ARGB);
  still.copy(cam, 0, 0, cam.width, cam.height, 0, 0, still.width, still.height);
  still.save(name);
}
public PImage loadImageFromUrl(String url){
  PImage img;
  img = loadImage(url);
  return img;
}
public void create3DfromImage(PImage img){
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      color c = img.get(60, 90);
      println("w: "+x+", h: "+y+", color: "+c);
    }
  }
}