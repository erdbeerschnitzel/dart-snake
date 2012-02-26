#import('dart:html');
#import('dart:core');
#source('Snake.dart');
#source('Ball.dart');
#resource('style.css');

class mc {

  Snake snake;
  Ball ball;
  var _intervalId;
  
  mc() {
    
    document.on.keyPress.add(onKeyPress);
    
    if(document.window.localStorage.getItem('highscore') != null) write('Previous Score: ' + document.window.localStorage.getItem('highscore'));
    
    snake = new Snake();
    ball = new Ball();

    _intervalId = document.window.setInterval(this.drawSnake, 10);
    
  }
  

  void drawSnake() {
    
    CanvasElement drawingArea = document.query('#drawingArea');
    
    CanvasRenderingContext2D ctx = drawingArea.getContext('2d');
    
    ctx.clearRect(2, 2, drawingArea.width, drawingArea.height);
    ctx.fillRect(ball.pos_X, ball.pos_Y, ball.size, ball.size);
    
    //TODO: improve!
    switch(snake.direction){
    
      case 'left':     for(var i=0; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X+i, snake.pos_Y, 1, 10);
      }

      case 'right': for(var i=0; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X-i, snake.pos_Y, 1, 10);
      }

      case 'up': for(var i=0; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X, snake.pos_Y+i, 10, 1);
      }

      case 'down': for(var i=0; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X, snake.pos_Y-i, 10, 1);
      }

    
    }
    
    

    if(snake.catches(ball)){
      
      write('Points: ' + snake.points);
      
      ball = new Ball();

    }

    
    if(snake.touchesWall(drawingArea)){
      
      writeStatus("Game over!");
      document.window.localStorage.setItem('highscore', snake.points.toString());

      document.window.clearInterval(_intervalId);
      document.on.keyPress.remove(onKeyPress);
      
    }else {
      
      //writeStatus(" " + drawingArea.width + " -> " +  drawingArea.height);
      writeStatus("ball pos: " + ball.pos_X.toInt() + ", " + ball.pos_Y.toInt() + ' to the ' + snake.direction + ' --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
      //writeStatus('to the ' + snake.direction + ' --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
    }
 }

  
  void write(String message) {

    document.query('#status').innerHTML = message;

  }
 
  void writeStatus(String message) {

    document.query('#snake').innerHTML = message;
  }
  
  void onKeyPress(event) {
    
    switch(event.keyCode){
    
    case 38: snake.direction = 'up'; snake.pos_Y -= 10; 
    case 40: snake.direction = 'down'; snake.pos_Y += 10;
    case 37: snake.direction = 'left'; snake.pos_X -= 10;
    case 39: snake.direction = 'right'; snake.pos_X += 10;
    
    }
  }
  
  
}

void main(){
  
  new mc();
}




