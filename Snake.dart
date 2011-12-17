class Snake {
  
  int lenght = 10;
  int width = 8;
  int pos_X = 25;
  int pos_Y = 25;
  int points = 0;
  String direction = 'right';
  String color = 'black';
  String pending_direction = 'right';  
  
  Snake(){
    
  }
  
  bool catches(Ball ball){
    
    if(ball.pos_Y >= this.pos_Y - 10 && ball.pos_Y <= this.pos_Y + 10 && ball.pos_X <= this.pos_X + 10 && ball.pos_X >= this.pos_X - 10) {
      
      this.lenght += 1;
      this.points += 1;
      
      return true;
    }
    
    return false;
      
  }
  
  bool touchesWall(){
    
    if(this.pos_X <= 3 ||  this.pos_X >= 293 || this.pos_Y <= 2 || this.pos_Y >= 143) return true;
    
    return false;
  }

}
