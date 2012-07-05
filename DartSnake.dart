#import('dart:html');
#import('dart:core');
#source('Snake.dart');
#source('Ball.dart');
#resource('css\style.css');

class mc {

  Snake snake;
  Ball ball;
  var _intervalId;
  
  mc() {
    
    document.on.keyPress.add(onKeyPress);

    if(document.window.localStorage['highscore'] != null) write('Previous Score: ${document.window.localStorage['highscore']}');
    
    snake = new Snake();
    ball = new Ball();

    _intervalId = document.window.setInterval(this.drawSnake, 5);
    
  }
  

  void drawSnake() {
    
    CanvasElement drawingArea = document.query('#drawingArea');
    
    CanvasRenderingContext2D ctx = drawingArea.getContext('2d');
    
    ctx.clearRect(2, 2, drawingArea.width, drawingArea.height);
    ctx.fillRect(ball.pos_X, ball.pos_Y, ball.size, ball.size);
    
    //TODO: improve!
    switch(snake.direction){
    
      case 'left':     
        
        ctx.fillStyle = 'red'; 
        ctx.fillRect(snake.pos_X, snake.pos_Y, 1, 10);
        
        ctx.fillStyle = 'black';
        
        for(var i=1; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X+i, snake.pos_Y, 1, 10);
        }
        
        break;

      case 'right': 
        
        ctx.fillStyle = 'red'; 
        ctx.fillRect(snake.pos_X, snake.pos_Y, 1, 10);
        ctx.fillStyle = 'black';
        
        for(var i=1; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X-i, snake.pos_Y, 1, 10);
        }
        
        break;

      case 'up': 
        
        ctx.fillStyle = 'red'; 
        ctx.fillRect(snake.pos_X, snake.pos_Y, 10, 1);
        ctx.fillStyle = 'black';
        
        for(var i=1; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X, snake.pos_Y+i, 10, 1);
        }
        
        break;

      case 'down': 
        
        
        ctx.fillStyle = 'red'; 
        ctx.fillRect(snake.pos_X, snake.pos_Y, 10, 1);
        ctx.fillStyle = 'black';
        
        for(var i=1; i < snake.parts.length; i++){
        
        ctx.fillRect(snake.pos_X, snake.pos_Y-i, 10, 1);
        }
        
        break;

    
    }

    
    if(snake.touchesWall(drawingArea)){
      
      writeStatus("Game over!");
      document.window.localStorage['highscore'] = snake.points.toString();

      document.window.clearInterval(_intervalId);
      document.on.keyPress.remove(onKeyPress);
      
    }else {
      
      //writeStatus(" " + drawingArea.width + " -> " +  drawingArea.height);
      writeStatus("ball pos: " + ball.pos_X.toInt() + ", " + ball.pos_Y.toInt() + ' to the ' + snake.direction + ' --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
      //writeStatus('to the ' + snake.direction + ' --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
    }    

    if(snake.catches(ball)){
      
      write('Points: ' + snake.points);
      
      ball = new Ball();

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
    
    case 38: snake.direction = 'up'; snake.pos_Y -= 10;  break;
    case 40: snake.direction = 'down'; snake.pos_Y += 10; break; 
    case 37: snake.direction = 'left'; snake.pos_X -= 10; break;
    case 39: snake.direction = 'right'; snake.pos_X += 10; break;
    
    }

  }
  
  
}

void main(){
  
  new mc();
}




