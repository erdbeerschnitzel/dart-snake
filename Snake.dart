class Snake {
  
  int lenght = 10;
  int width = 10;
  int pos_X;
  int pos_Y;
  int points = 0;
  String direction = 'right';
  String color = 'black';
  String pending_direction = 'right';  
  
  Snake(){
    
    pos_X = 25;
    pos_Y = 25;
    
  }
  
  bool catches(Ball ball){
    
    if(ball.pos_Y >= this.pos_Y - 10 && ball.pos_Y <= this.pos_Y + 10 && ball.pos_X <= this.pos_X + 10 && ball.pos_X >= this.pos_X - 10) {
      
      this.lenght += 5;
      this.points += 1;
      
      return true;
    }
    
    return false;
      
  }
  
  bool touchesWall(CanvasElement canvas){
    
    if(this.pos_X <= 3 ||  this.pos_X >= canvas.width - 3 || this.pos_Y <= 2 || this.pos_Y >= canvas.height - 3) return true;
    
    return false;
  }

}
