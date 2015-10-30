// THIS IS A MESS...
// TODO:
// [ ] Clean up image filenames
// [ ] Generalize by putting images into 2D array

import processing.sound.*;

float speedFactor;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

PImage[] melonImgs = new PImage[100];
PImage[] danceImgs = new PImage[178];
PImage[] matchImgs = new PImage[14];
PImage[] punchImgs = new PImage[59];
//PImage[] fireImgs = new PImage[522];
PImage[] sickImgs = new PImage[19];
PImage[] caterpillarImgs = new PImage[46];
PImage[] trumpImgs = new PImage[131];
//PImage[] siloImgs = new PImage[71];
//PImage[] golfImgs = new PImage[69];
//PImage[] pieImgs = new PImage[64];
//PImage[] inkImgs = new PImage[32];
//PImage[] baseballImgs = new PImage[81];
//PImage[] eightbitImgs = new PImage[16];
PImage[] cubeImgs = new PImage[192];
PImage[] glitchImgs = new PImage[47];
PImage[] witchImgs = new PImage[54];
//PImage[] doughImgs = new PImage[67];

PImage[] universeImgs = new PImage[38];
PImage[] tImgs = new PImage[41];
PImage[] smokefaceImgs = new PImage[24];
PImage[] pushupsImgs = new PImage[16];
PImage[] pgoatImgs = new PImage[29];
PImage[] nightImgs = new PImage[83];
PImage[] monsterImgs = new PImage[58];
//PImage[] legsImgs = new PImage[64];
PImage[] keyboardImgs = new PImage[68];
PImage[] horrorImgs = new PImage[67];
//PImage[] headexplodeImgs = new PImage[9];
PImage[] handsImgs = new PImage[135];
PImage[] facegrowImgs = new PImage[77];
PImage[] doorImgs = new PImage[73];
PImage[] bulletImgs = new PImage[25];
//PImage[] bubblesImgs = new PImage[9];
//PImage[] bridgeImgs = new PImage[75];
PImage[] artImgs = new PImage[102];
PImage[] snuggieImgs = new PImage[21];
PImage[] mooseImgs = new PImage[63];
//PImage[] deerImgs = new PImage[497];
PImage[] mriImgs = new PImage[146];
PImage[] handcircleImgs = new PImage[14];
PImage[] fractalImgs = new PImage[40];
PImage[] walkImgs = new PImage[30];
PImage[] spikesImgs = new PImage[10];
PImage[] loopImgs = new PImage[50];
PImage[] doomImgs = new PImage[50];
PImage[] hstImgs = new PImage[21];
PImage[] cigaretteImgs = new PImage[51];
//PImage[] celloImgs = new PImage[28];
PImage[] mouseImgs = new PImage[26];
PImage[] smokerImgs = new PImage[31];
PImage[] icecreamImgs = new PImage[12];



PImage[] curImgs;
float maxAvg = 0.0001;
int curIx = 0;

int imgWidth;
int imgHeight;
int imgX;
int imgY;

float arrSum(float[] arr) {
  float result = 0;
  for (int i=0; i<arr.length; i++) {
    result += arr[i];
  }
  return result;
}

void setImgDimensions() {
  if (curImgs[0].height < curImgs[0].width) {
    imgHeight = int((float(displayWidth)/curImgs[0].width) * curImgs[0].height);
    imgWidth = displayWidth;
    imgX = 0;
    imgY = displayHeight/2 - imgHeight/2;
  }
  else {
    imgHeight = displayHeight;
    imgWidth = int((float(displayHeight)/curImgs[0].height) * curImgs[0].width);
    imgX = displayWidth/2 - imgWidth/2;
    imgY = 0;
  }
  speedFactor = curImgs.length/12.0;
}

void setup() {
  size(displayWidth, displayHeight);

  for (int i = 0; i < melonImgs.length; i++) {
    melonImgs[i] = loadImage("melon/melon-"+(i+9)+".jpg");
  }
  
  for (int i=0; i < danceImgs.length; i++) {
    String filename = String.format("dancer/%04d.jpg", i);
    danceImgs[i] = loadImage(filename);
  }
  
  for (int i=0; i < matchImgs.length; i++) {
    String filename = String.format("matches/%04d.png", i);
    matchImgs[i] = loadImage(filename);
  }
  
  for (int i=0; i < punchImgs.length; i++) {
    String filename = String.format("punch/%04d.png", i+30);
    punchImgs[i] = loadImage(filename);
  }
  
  //for (int i=0; i < fireImgs.length; i++) {
  //  String filename = String.format("fire/%04d.png", i);
  //  fireImgs[i] = loadImage(filename);
  //}
  
  for (int i=0; i < sickImgs.length; i++) {
    String filename = String.format("sick/%04d.png", i);
    sickImgs[i] = loadImage(filename);
  }
  
  for (int i=0; i < caterpillarImgs.length; i++) {
    String filename = String.format("caterpillar/%04d.png", i);
    caterpillarImgs[i] = loadImage(filename);
  }

  for (int i=0; i < trumpImgs.length; i++) {
    String filename = String.format("trump/%04d.png", i);
    trumpImgs[i] = loadImage(filename);
  }
  
  //for (int i=0; i < siloImgs.length; i++) {
  //  String filename = String.format("silo/%04d.png", i);
  //  siloImgs[i] = loadImage(filename);
  //}
  
  //for (int i=0; i < golfImgs.length; i++) {
  //  String filename = String.format("golf/%04d.png", i);
  //  golfImgs[i] = loadImage(filename);
  //}
  
  //for (int i=0; i < pieImgs.length; i++) {
  //  String filename = String.format("pie/%04d.png", i);
  //  pieImgs[i] = loadImage(filename);
  //}

  //for (int i=0; i < inkImgs.length; i++) {
  //  String filename = String.format("ink/%04d.png", i);
  //  inkImgs[i] = loadImage(filename);
  //}

  //for (int i=0; i < baseballImgs.length; i++) {
  //  String filename = String.format("baseball/%04d.png", i);
  //  baseballImgs[i] = loadImage(filename);
  //}
  
  //for (int i=0; i < eightbitImgs.length; i++) {
  //  String filename = String.format("8bit/%04d.png", i);
  //  eightbitImgs[i] = loadImage(filename);
  //}
  
  for (int i=0; i < cubeImgs.length; i++) {
    String filename = String.format("cube/%04d.png", i);
    cubeImgs[i] = loadImage(filename);
  }
  
  for (int i=0; i < glitchImgs.length; i++) {
    String filename = String.format("glitch/%04d.png", i);
    glitchImgs[i] = loadImage(filename);
  }
  
  for (int i=0; i < witchImgs.length; i++) {
    String filename = String.format("witch/%04d.png", i);
    witchImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < doughImgs.length; i++) {
  //  String filename = "dough/teig-"+i+".jpg";
  //  doughImgs[i] = loadImage(filename);
  //}
  
  for (int i=0; i < universeImgs.length; i++) {
    String filename = String.format("universe/%04d.png", i);
    universeImgs[i] = loadImage(filename);
  }

  for (int i=0; i < tImgs.length; i++) {
    String filename = String.format("t/%04d.png", i);
    tImgs[i] = loadImage(filename);
  }

  for (int i=0; i < smokefaceImgs.length; i++) {
    String filename = String.format("smokeface/%04d.png", i);
    smokefaceImgs[i] = loadImage(filename);
  }

  for (int i=0; i < pushupsImgs.length; i++) {
    String filename = String.format("pushups/%04d.png", i);
    pushupsImgs[i] = loadImage(filename);
  }

  for (int i=0; i < pgoatImgs.length; i++) {
    String filename = String.format("pgoat/%04d.png", i);
    pgoatImgs[i] = loadImage(filename);
  }

  for (int i=0; i < nightImgs.length; i++) {
    String filename = String.format("night/%04d.png", i);
    nightImgs[i] = loadImage(filename);
  }

  for (int i=0; i < monsterImgs.length; i++) {
    String filename = String.format("monster/%04d.png", i);
    monsterImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < legsImgs.length; i++) {
  //  String filename = String.format("legs/%04d.png", i);
  //  legsImgs[i] = loadImage(filename);
  //}

  for (int i=0; i < keyboardImgs.length; i++) {
    String filename = String.format("keyboard/%04d.png", i);
    keyboardImgs[i] = loadImage(filename);
  }

  for (int i=0; i < horrorImgs.length; i++) {
    String filename = String.format("horror/%04d.png", i);
    horrorImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < headexplodeImgs.length; i++) {
  //  String filename = String.format("headexplode/%04d.png", i);
  //  headexplodeImgs[i] = loadImage(filename);
  //}

  for (int i=0; i < handsImgs.length; i++) {
    String filename = String.format("hands/%04d.png", i);
    handsImgs[i] = loadImage(filename);
  }

  for (int i=0; i < facegrowImgs.length; i++) {
    String filename = String.format("facegrow/%04d.png", i);
    facegrowImgs[i] = loadImage(filename);
  }

  for (int i=0; i < doorImgs.length; i++) {
    String filename = String.format("door/%04d.png", i);
    doorImgs[i] = loadImage(filename);
  }

  for (int i=0; i < bulletImgs.length; i++) {
    String filename = String.format("bullet/%04d.png", i);
    bulletImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < bubblesImgs.length; i++) {
  //  String filename = String.format("bubbles/%04d.png", i);
  //  bubblesImgs[i] = loadImage(filename);
  //}

  //for (int i=0; i < bridgeImgs.length; i++) {
  //  String filename = String.format("bridge/%04d.png", i);
  //  bridgeImgs[i] = loadImage(filename);
  //}

  for (int i=0; i < artImgs.length; i++) {
    String filename = String.format("art/%04d.png", i);
    artImgs[i] = loadImage(filename);
  }

  for (int i=0; i < snuggieImgs.length; i++) {
    String filename = String.format("snuggie/%04d.png", i);
    snuggieImgs[i] = loadImage(filename);
  }

  for (int i=0; i < mooseImgs.length; i++) {
    String filename = String.format("moose/%04d.png", i);
    mooseImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < deerImgs.length; i++) {
  //  String filename = String.format("deer/%04d.png", i);
  //  deerImgs[i] = loadImage(filename);
  //}

  for (int i=0; i < mriImgs.length; i++) {
    String filename = String.format("mri/%04d.png", i);
    mriImgs[i] = loadImage(filename);
  }

  for (int i=0; i < handcircleImgs.length; i++) {
    String filename = String.format("handcircle/%04d.png", i);
    handcircleImgs[i] = loadImage(filename);
  }

  for (int i=0; i < fractalImgs.length; i++) {
    String filename = String.format("fractal/%04d.png", i);
    fractalImgs[i] = loadImage(filename);
  }

  for (int i=0; i < walkImgs.length; i++) {
    String filename = String.format("walk/%04d.png", i);
    walkImgs[i] = loadImage(filename);
  }

  for (int i=0; i < spikesImgs.length; i++) {
    String filename = String.format("spikes/%04d.png", i);
    spikesImgs[i] = loadImage(filename);
  }

  for (int i=0; i < loopImgs.length; i++) {
    String filename = String.format("loop/%04d.png", i);
    loopImgs[i] = loadImage(filename);
  }

  for (int i=0; i < doomImgs.length; i++) {
    String filename = String.format("doom/%04d.png", i);
    doomImgs[i] = loadImage(filename);
  }

  for (int i=0; i < hstImgs.length; i++) {
    String filename = String.format("hst/%04d.png", i);
    hstImgs[i] = loadImage(filename);
  }

  for (int i=0; i < cigaretteImgs.length; i++) {
    String filename = String.format("cigarette/%04d.png", i);
    cigaretteImgs[i] = loadImage(filename);
  }

  //for (int i=0; i < celloImgs.length; i++) {
  //  String filename = String.format("cello/%04d.png", i);
  //  celloImgs[i] = loadImage(filename);
  //}

  for (int i=0; i < mouseImgs.length; i++) {
    String filename = String.format("mouse/%04d.png", i);
    mouseImgs[i] = loadImage(filename);
  }

  for (int i=0; i < smokerImgs.length; i++) {
    String filename = String.format("smoker/%04d.png", i);
    smokerImgs[i] = loadImage(filename);
  }

  for (int i=0; i < icecreamImgs.length; i++) {
    String filename = String.format("icecream/%04d.png", i);
    icecreamImgs[i] = loadImage(filename);
  }

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);

  // start the Audio Input
  in.start();

  // patch the AudioIn
  fft.input(in);
  
  curImgs = melonImgs;
  
  setImgDimensions();
}

void draw() {
  background(0);
  
  fft.analyze(spectrum);

  float avg = arrSum(spectrum)/spectrum.length;

  if (avg > maxAvg) {
    maxAvg = avg;
  }

  int tgtIx = floor(map(avg, 0.0, maxAvg, 0.0, float(curImgs.length)-0.01));
  
  float speedFactor = curImgs.length/10.0;

  if (tgtIx > curIx && curIx < curImgs.length-1) {
   float diff = float(tgtIx - curIx);
   curIx += ceil(diff/speedFactor);
  } 
  else if (tgtIx < curIx && curIx > 0) {
    float diff = float(curIx - tgtIx);
   curIx -= ceil(diff/speedFactor);
  }

  image(curImgs[curIx], imgX, imgY, imgWidth, imgHeight);
}

void keyPressed() {
  curIx = 0;
  
  if (key == '1') {
    curImgs = melonImgs;
  }
  else if (key == '2') {
    curImgs = danceImgs;
  }
  else if (key == '3') {
    curImgs = matchImgs;
  }
  else if (key == '4') {
    curImgs = punchImgs;
  }
  else if (key == '5') {
    curImgs = sickImgs;
  }
  else if (key == '6') {
    curImgs = caterpillarImgs;
  }
  else if (key == '7') {
    curImgs = trumpImgs;
  }
  else if (key == '8') {
    curImgs = cubeImgs;
  }
  else if (key == '9') {
    curImgs = glitchImgs;
  }
  else if (key == '0') {
    curImgs = witchImgs;
  }
  else if (key == 'q') {
    curImgs = universeImgs;
  }
  else if (key == 'w') {
    curImgs = tImgs;
  }
  else if (key == 'e') {
    curImgs = smokefaceImgs;
  }
  else if (key == 'r') {
    curImgs = pushupsImgs;
  }
  else if (key == 't') {
    curImgs = pgoatImgs;
  }
  else if (key == 'y') {
    curImgs = nightImgs;
  }
  else if (key == 'u') {
    curImgs = monsterImgs;
  }
  else if (key == 'i') {
    curImgs = keyboardImgs;
  }
  else if (key == 'o') {
    curImgs = horrorImgs;
  }
  else if (key == 'p') {
    curImgs = handsImgs;
  }
  else if (key == 'a') {
    curImgs = facegrowImgs;
  }
  else if (key == 's') {
    curImgs = doorImgs;
  }
  else if (key == 'd') {
    curImgs = bulletImgs;
  }
  else if (key == 'f') {
    curImgs = artImgs;
  }
  else if (key == 'g') {
    curImgs = snuggieImgs;
  }
  else if (key == 'h') {
    curImgs = mooseImgs;
  }
  else if (key == 'j') {
    curImgs = mriImgs;
  }
  else if (key == 'k') {
    curImgs = handcircleImgs;
  }
  else if (key == 'l') {
    curImgs = fractalImgs;
  }
  else if (key == 'z') {
    curImgs = walkImgs;
  }
  else if (key == 'x') {
    curImgs = spikesImgs;
  }
  else if (key == 'c') {
    curImgs = loopImgs;
  }
  else if (key == 'v') {
    curImgs = doomImgs;
  }
  else if (key == 'b') {
    curImgs = hstImgs;
  }
  else if (key == 'n') {
    curImgs = cigaretteImgs;
  }
  else if (key == 'm') {
    curImgs = mouseImgs;
  }
  else if (keyCode == '-') {
    curImgs = smokerImgs;
  }
  else if (keyCode == '=') {
    curImgs = icecreamImgs;
  }
  
  maxAvg = 0.0001;
  setImgDimensions();
}