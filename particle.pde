class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector force;
  PVector[] vArr;
  int normPosX;
  int normPosY;
  int res;
  int index;
  int rowsize;
  int colsize;
  int maxspeed = 2;
  
  Particle(int rows, int cols, int scl, PVector[] vectorArr){
    pos = new PVector(random(width),random(height));
    //vel = PVector.random2D();
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    res = scl;
    rowsize = rows;
    colsize = cols;
    vArr = new PVector[rows*cols];
    vArr = vectorArr;
    //update();
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
    
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void display(){
    stroke(0);
    strokeWeight(4);
    point(pos.x,pos.y);
  }
  
  void checkEdges(){
    if (pos.x > width){
      pos.x = 0;
    }
    else if (pos.x < 0){
      pos.x= width;
    }
    
    if (pos.y > height){
      pos.y = 0;
    }    
    else if (pos.y < 0){
      pos.y= height;
    }
  }
  
  void follow(PVector[] vArr){
    normPosX = floor(pos.x/res);
    normPosY = floor(pos.y/res);
    //convert 2D array to a 1D array
    index = (normPosX + normPosY*rowsize);
    if (index < rowsize * colsize){
      force = vArr[index];
    }
    applyForce(force);
  }
   
}
