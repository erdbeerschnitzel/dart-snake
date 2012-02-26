class Snake {
  
  int width = 10;
  int pos_X;
  int pos_Y;
  int points = 0;
  String direction = 'right';
  String color = 'black';
  String pending_direction = 'right';  
  List<int> parts;
  
  Snake(){
    
    pos_X = 25;
    pos_Y = 25;
    
    parts = new List<int>();
    
    for(var i= 0; i < 10; i++){
      
      parts.add(1);
    }
    
  }
  
  void increaseLength(int length){
    
    for(var i= 0; i < length; i++){
      
      parts.add(1);
    }
    
  }
  
  bool catches(Ball ball){
    
    if(ball.pos_Y >= this.pos_Y - 10 && ball.pos_Y <= this.pos_Y + 10 && ball.pos_X <= this.pos_X + 10 && ball.pos_X >= this.pos_X - 10) {
      
      increaseLength(5);
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
