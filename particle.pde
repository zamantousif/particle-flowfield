class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  
  
  Particle(){
    pos = new PVector(random(width),random(height));
    vel = PVector.random2D();
    acc = new PVector(0,0);
    
    //update();
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void display(){
    stroke(0);
    strokeWeight(3);
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
   
}
