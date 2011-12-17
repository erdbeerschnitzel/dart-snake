#import('dart:html');
#import('dart:core');
#source('Snake.dart');
#source('Ball.dart');

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
    
    var kannwas = document.query('#kannwas');
    
    CanvasRenderingContext2D ctx = kannwas.getContext('2d');
    
    ctx.clearRect(2, 2, 398, 398);
    ctx.fillRect(ball.pos_X, ball.pos_Y, 8, 8);
    ctx.fillRect(snake.pos_X, snake.pos_Y, snake.lenght, 10); 

    if(snake.catches(ball)){
      
      write('Points: ' + snake.points);
      
      ball = new Ball();

    }

    
    if(snake.touchesWall()){
      
      writeStatus("Game over!");
      document.window.localStorage.setItem('highscore', snake.points.toString());

      document.window.clearInterval(_intervalId);  
      document.on.keyPress.remove(onKeyPress);
      
    }else {
      
      writeStatus('to the  ' + snake.direction + '  --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
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



