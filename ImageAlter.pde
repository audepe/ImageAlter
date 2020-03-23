import processing.video.*;
import java.util.Timer;
import java.util.TimerTask;

TimerTask timerTask = new TimerTask()
{
  public void run() 
  {
    crt.resize(big.width*(int)(ratio*multiplier), big.height*(int)(ratio*multiplier));
  }
};

TimerTask reloadTask = new TimerTask()
{
  public void run() 
  {
    crt = loadImage(dataPath("crt.png"));
  }
};

float ratio;
CVFaces detector;
Capture cap;
PImage crt;
float multiplier;
Timer timer = new Timer();
Timer timer_r = new Timer();

Rect big = new Rect(1, 1, 1, 1);

void setup() {
  size(640, 480);
  background(0);

  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

  multiplier = 1.5;
  imageMode(CENTER);
  crt = loadImage(dataPath("crt.png"));

  detector = new CVFaces();
  cap = new Capture(this, width, height);
  cap.start();
  timer.scheduleAtFixedRate(timerTask, 500, 2*1000);
  timer_r.scheduleAtFixedRate(reloadTask, 5000, 10*1000);
}
void draw() {
  if (!cap.available())
    return;

  background(0);

  cap.read();



  image(cap, width/2, height/2);

  Rect [] facesArr = detector.getFaces(cap);
  if (facesArr.length > 0) {
    big = facesArr[0];
    for (Rect r : facesArr) {
      if (r.width > big.width) {
        big = r;
      }
    }
    ellipse(big.x*ratio + big.width*ratio/2, big.y*ratio + big.height*ratio/2, 3, 3);
    PImage dummy = cap.get((int)(big.x*ratio)-25, (int)(big.y*ratio)-25, (int)(big.width*ratio)+50, (int)(big.height*ratio)+50);
    dummy.filter(GRAY);
    dummy.filter(POSTERIZE, 4);
    imageMode(CORNER);
    image(dummy, (big.x*ratio) -25, (big.y*ratio) -25);
    imageMode(CENTER);
    image(crt, big.x*ratio + big.width*ratio/2, big.y*ratio + big.height*ratio/2);
  }
}
