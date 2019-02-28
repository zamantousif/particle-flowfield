//define a class FlowField
class FlowField{
  
  PVector[][] field;
  
  FlowField(float offs, int scl, int xsize, int ysize){
    //set resolution to have one PVector object for every 10 pixels
    //resolution = 10;
    //rows = height/resolution;
    //cols = width/resolution;
    field = new PVector[xsize][ysize];
    init(offs, scl);
  }
  
  //init method
  void init(float offs, int scl){
    PVector v;
    float xoff = 0;
    for (int y=0;y<rows;y++){
      float yoff = 0;
      for(int x=0;x<cols;x++){
        //calculate angle for the flow field
        float angle = map(noise(xoff,yoff,zoff),0,1,0,TWO_PI);
        //get an angle within 2PI using Perlin noise 
        //float angle = noise(xoff,yoff)*TWO_PI;
        //create a vector from some random angle within 2PI
        //v = PVector.fromAngle(angle);
        
        //map polar to cartesian coordinates
        field[x][y] = new PVector(cos(angle),sin(angle));
        yoff += offs;
        //field[x][y] = new PVector(1,0);
        //fill(theta);
        //rect(x*scl,y*scl,scl,scl);
        stroke(0,50);
        strokeWeight(1);
        push();
        translate(x*scl, y*scl);
        rotate(field[x][y].heading());
        //rotate(v.heading());
        line(0,0,scl,0);
        pop();
        
      }
      xoff += offs;
    }
    //zoff += 0.005;
  }
      
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].copy(); //used copy() as method get() is deprecated
  }
    
}
