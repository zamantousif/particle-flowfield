Particle[] p = new Particle[50];
FlowField ff;

int rows, cols;
int resolution = 20;
float offset = 0.1;
float zoff = 0;
PVector[] flowfieldArr;

void setup(){
  size(400,400);
  //resolution = 20;
  
  rows = floor(height/resolution);
  cols = floor(width/resolution);
  
  flowfieldArr = new PVector[rows*cols];
  
  //create a flow field
  ff = new FlowField(offset,resolution,rows,cols,flowfieldArr);
  
  //spawn some particles in the field
  for (int i=0;i < p.length;i++){
    p[i] = new Particle(rows,cols,resolution,flowfieldArr);
  }
  
}

void draw(){
  background(255);
  
  //draw the flow field
  ff.init(offset,resolution,flowfieldArr);
  
  //give the required properties to each particle
  for (Particle par : p){
    par.follow(flowfieldArr);
    par.update();
    par.display();
    par.checkEdges();
  }
  
  //check the frame rate
  println("Frame rate = "+floor(frameRate));
}
