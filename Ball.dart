class Ball {
  
  int pos_X;
  int pos_Y;
  
  Ball(){
    
    pos_X = 2 + Math.random()*Math.random()*324324;
    pos_Y = 2 + Math.random()*Math.random()*324324;
    
    while(pos_X > 300) pos_X = 0 + pos_X / 2;
    
    while(pos_Y > 140) pos_Y = 0 + pos_Y / 2;
  }
}
