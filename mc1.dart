#import('dart:html');
#import('dart:core');
#source('Snake.dart');
#source('Ball.dart');
#resource('style.css');

class mc {

  Snake snake;
  Ball ball;
  var _intervalId;
  var menuDivPosition = 1;
  var menuText = "Some";
  
  mc() {
    
    document.on.keyPress.add(onKeyPress);
    
    if(document.window.localStorage.getItem('highscore') != null) write('previous Score: ' + document.window.localStorage.getItem('highscore'));
    
    snake = new Snake();
    ball = new Ball();
    
    DivElement some = document.query('#some');
    DivElement thing = document.query('#thing');
   
    _intervalId = document.window.setInterval(this.drawSnake, 10);
    
  }
  

  void drawSnake() {
    
    CanvasElement drawingArea = document.query('#drawingArea');
    
    CanvasRenderingContext2D ctx = drawingArea.getContext('2d');
    
    ctx.clearRect(2, 2, drawingArea.width, drawingArea.height);
    ctx.fillRect(ball.pos_X, ball.pos_Y, ball.size, ball.size);
    
    //TODO: improve!
    switch(snake.direction){
    
      case 'left': ctx.fillRect(snake.pos_X, snake.pos_Y, snake.lenght, 10);
      case 'right': ctx.fillRect(snake.pos_X, snake.pos_Y, snake.lenght, 10);
      case 'up': ctx.fillRect(snake.pos_X, snake.pos_Y, 10, snake.lenght);
      case 'down': ctx.fillRect(snake.pos_X, snake.pos_Y, 10, snake.lenght);
    
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
      
      writeStatus('to the ' + snake.direction + ' --> x: ' + snake.pos_X + ' y: ' + snake.pos_Y);
    }
 }

  void changePosition() {

    DivElement status =  document.query('#menu_bar');
    
    status.innerHTML = "<h1>" + menuText + "</h1>";

  
    if(menuDivPosition < 75){
    
      status.style.cssText = "text-align:center; position:absolute;  display:block; top:" + menuDivPosition.abs() + "px;";
      
      menuDivPosition =  menuDivPosition + 1;
    }
   
    
   }
  
  void write(String message) {

    document.query('#status').innerHTML = message;

  }
 
  void writeStatus(String message) {

    document.query('#snake').innerHTML = message;
  }
  
  void onKeyPress(event) {
    
    var home = document.window.setInterval(this.changePosition, 10);

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



