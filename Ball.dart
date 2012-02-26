class Ball {
  
  int pos_X;
  int pos_Y;
  int size = 8;
  
  Ball(){
    
    pos_X = (2 + Math.random()*Math.random()*400).abs();
    pos_Y = (2 + Math.random()*Math.random()*400).abs();
    
    while(pos_X > 300) pos_X = (pos_X / 2).toInt();
    
    while(pos_Y > 300) pos_Y = (pos_Y / 2).toInt();
    
    if(pos_X < 5) pos_X += 10;
    
    if(pos_Y < 5) pos_Y += 10;
    
    //while(pos_X > 385) pos_X = pos_X - 50;
    //while(pos_Y > 385) pos_Y = pos_Y - 50;
  }
}
