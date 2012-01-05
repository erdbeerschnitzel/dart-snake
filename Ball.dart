class Ball {
  
  int pos_X;
  int pos_Y;
  int size = 8;
  
  Ball(){
    
    pos_X = (2 + Math.random()*Math.random()*324324).abs();
    pos_Y = (2 + Math.random()*Math.random()*324324).abs();
    
    while(pos_X > 300) pos_X = 0 + pos_X / 2;
    
    while(pos_Y > 140) pos_Y = 0 + pos_Y / 2;
    
    //while(pos_X > 385) pos_X = pos_X - 50;
    //while(pos_Y > 385) pos_Y = pos_Y - 50;
  }
}
