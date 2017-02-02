int angleChange = 90;
int timer = 0;
int blowingTimer = 0;
int snowAngleChange = 0;

Button windyButton = new Button(70, 250, "windy");
Button snowyButton = new Button(70, 350, "snowy");
Button hailyButton = new Button(70, 450, "haily");

boolean isItWindy = false;
boolean isItSnowy = false;
boolean isItHaily = false;

int [] backgroundColors = {color(230,238,255), color(0), color(77, 219, 255), color(36, 71, 143)};
int backgroundColor = backgroundColors[0];

ArrayList<Hail> hailThings = new ArrayList<Hail>();
ArrayList<SnowFlake> snowThings = new ArrayList<SnowFlake>();

void setup()
{
  size(1000,900);
  rectMode(CENTER);

  for(int i = 0; i < 100; i++)
  {
    hailThings.add(new Hail());
  }

  for(int i = 0; i< 30; i++)
  {
    snowThings.add(new SnowFlake());
  }

}
void draw()
{
  background(backgroundColor);

  for(int xx = 5; xx<width+100; xx+=100)
    for(int yy = 5; yy<height; yy+=80)
      spiralBackground(xx,yy, 98, 30);

  ground();


  //big size
  treeThing(width/2, height-20, angleChange, 100, 36,1, 8);
  //medium size
  treeThing(width/4, height-40, angleChange, 50, 15,1, 4);
  treeThing(width-(width/4), height-40, angleChange, 50, 15,1, 4);
  //small size
  treeThing(width/8, height - 60, angleChange, 25, 7, 1, 2);
  treeThing(width/8+width/4, height - 60, angleChange, 25, 7, 1, 2);
  treeThing(width/8+width/2, height - 60, angleChange, 25, 7, 1, 2);
  treeThing(width-(width/8), height - 60, angleChange, 25, 7, 1, 2);

  cloudThing(width/2, 110, 150);
  cloudThing(width/6, 110, 150);
  cloudThing(width*5/6, 110, 150);
  
  startFunction();

}

void mousePressed()
{
  if(mouseX > 10 && mouseX < 130 && mouseY > 215 && mouseY < 285)
  {
    angleChange = 70;
    timer = 0;
    blowingTimer = 0;
    isItWindy = true;
    isItHaily = false;
    isItSnowy = false;
  }

  if(mouseX > 10 && mouseX < 130 && mouseY > 315 && mouseY < 385)
  {
    angleChange = 90;
    isItWindy = false;
    isItHaily = false;
    isItSnowy = true;
  }

  if(mouseX > 10 && mouseX < 130 && mouseY > 415 && mouseY < 485)
  {
    angleChange = 90;
    isItWindy = false;
    isItHaily = true;
    isItSnowy = false;
  }
  
}

void treeThing(int x1, int y1, float angle, double len, float strokee, int randomm, int max)
{
  int x2 = x1 - (int)(cos(radians(angle)) * len);
  int y2 = y1 - (int)(sin(radians(angle)) * len);
  
  if(randomm % max==0)
  {
    noStroke();
  	fill(153,102,255);
  	ellipse(x2,y2, 15, 15);
  }
  
  stroke(102,51,0);
  strokeWeight(strokee);
  line(x1, y1, x2, y2);

  if(len > 5)
  {
    treeThing(x2, y2, angle-20, len-12, strokee/1.5, randomm+1, max);
    treeThing(x2, y2, angle+20, len-12, strokee/1.5, randomm+1, max);
  }
}

void cloudThing(int x, int y, int siz)
{
	stroke(166,160,152);
	fill(191,188,184);
	ellipse(x,y,siz, siz);
	if(siz>20)
	{
		cloudThing(x-siz/2,y+siz/4,siz/2);
		cloudThing(x+siz/2,y+siz/4,siz/2);
	}
}

void spiralBackground(int x1, int y1, float angle, double len)
{
  int x2 = x1 - (int)(cos(radians(angle)) * len);
  int y2 = y1 - (int)(sin(radians(angle)) * len);
  
  stroke(102,150,255, 60);
  strokeWeight(3);
  line(x1, y1, x2, y2);

  if(len > 0)
  {
    spiralBackground(x2, y2, angle+46, len-2);
  }
}

void ground()
{
  fill(0,204,0);
  rect(width/2, height-20, width, 40);
  stroke(0,128,0);
  fill(0,153,0);
  arc(width/4-10, height, width/2+50, 150, 7*PI/6, 11*PI/6);
  arc(width-(width/4-10), height, width/2+50, 150, 7*PI/6, 11*PI/6);
}

void windy()
{
  backgroundColor = backgroundColors[3];
  if (timer < 50)
  {
    timer++;
    blowingTimer = 0;
    angleChange += 1;
  }
  if(timer == 50)
  {
    angleChange -= 1;
    blowingTimer ++;
    if(blowingTimer == 50)
    {
      timer = 0;
    }
  }
}

void haily()
{
  backgroundColor = backgroundColors[1];

  for(Hail blah : hailThings)
  {
    blah.move();
    blah.show();
  }
}

void snowy()
{
  backgroundColor = backgroundColors[2];
  //sF1.show();
  //sF1.move();

  for(SnowFlake flake : snowThings)
  {
    flake.move();
    flake.show();
  }
  snowAngleChange +=2;
}

void startFunction()
{
  if(isItWindy == true){ windy();}
  if(isItHaily == true){ haily();}
  if(isItSnowy == true){ snowy();}

  windyButton.show();
  hailyButton.show();
  snowyButton.show();
  if(mouseX > 10 && mouseX < 130 && mouseY > 215 && mouseY < 285){windyButton.highlighted();}
  else if(mouseX > 10 && mouseX < 130 && mouseY > 315 && mouseY < 385){snowyButton.highlighted();}
  else if(mouseX > 10 && mouseX < 130 && mouseY > 415 && mouseY < 485){hailyButton.highlighted();}
  else
  {
    windyButton.nonHighlighted();
    snowyButton.nonHighlighted();
    hailyButton.nonHighlighted();
  }
}

class Button
{
  private int myX, myY, myColor;
  private String myType;

  Button(int x, int y, String type)
  {
    myX = x;
    myY = y;
    myType = type;
    myColor = 255;
  }

  public void show()
  {
    noStroke();
    fill(myColor);
    rect(myX, myY, 120,70, 10);
    
    if (myType == "windy")
    {
      fill(0);
      textSize(30);
      text("Windy", myX-42, myY+12);
    }
    else if(myType == "snowy")
    {
      fill(0);
      textSize(30);
      text("Snowy", myX-42, myY+12);
    }
    else if(myType == "haily")
    {
      fill(0);
      textSize(30);
      text("Haily", myX-42, myY+12);
    }
  }
  
  public void highlighted()
  {
    myColor = 100;      
  }   
  public void nonHighlighted()
  {
    myColor = 255;
  }
}

class Hail
{
  float myX, myY, mySpeed, myOriginalX, myOriginalY;
  float myAngle;

  Hail()
  {
    myX = (int)(Math.random()*(width-200)) + 100;
    myY = (int)(Math.random()*(height-185)) + 185;
    myOriginalX = myX;
    myOriginalY = myY;
    float tempAngle = (float)Math.random()*150+20;
    myAngle = radians(tempAngle);
    mySpeed = 10;
  }

  void show()
  {
    fill(242);
    stroke(242);
    rect(myX, myY, 5, 10);
  }

  void move()
  {
    myX += cos(myAngle)*mySpeed;
    myY += sin(myAngle)+mySpeed;

    if(myX > width || myY > height)
    {
      myX=myOriginalX;
      myY=185;
    }
  }
}

class SnowFlake
{
  int myX, myY, myOriginalX, myOriginalY;
  float mySpeed;
  float myAngle;

  SnowFlake()
  {
    myX = (int)(Math.random()*(width-200)) + 100;
    myY = (int)(Math.random()*(height-185)) + 185;
    myOriginalX = myX;
    myOriginalY = myY;
    float tempAngle = (float)Math.random()*150+20;
    myAngle = radians(tempAngle);
    mySpeed = 10;
  }

  void show()
  {
    snoww(myX, myY, 0 + snowAngleChange, 20);
    snoww(myX, myY, 60 + snowAngleChange, 20);
    snoww(myX, myY, 120 + snowAngleChange, 20);
    snoww(myX, myY, 180 + snowAngleChange, 20);
    snoww(myX, myY, 240 + snowAngleChange, 20);
    snoww(myX, myY, 300 + snowAngleChange, 20);
    snoww(myX, myY, 360 + snowAngleChange, 20);
  }
  
  void move()
  {
    myX+=(int)(cos(myAngle)*mySpeed);
    myY+=(int)(sin(myAngle)*mySpeed);
    
    if(myX > width || myY > height)
    {
      myX=myOriginalX;
      myY=185;
    }
  }
}
  
void snoww(int x1, int y1, float angle, double len)
{
  int x2 = x1 - (int)(cos(radians(angle)) * len);
  int y2 = y1 - (int)(sin(radians(angle)) * len);
    
  stroke(102,51,0);
  strokeWeight(2);
  line(x1, y1, x2, y2);

  if(len > 5)
  {
    snoww(x2, y2, angle-20, len-5);
    snoww(x2, y2, angle+20, len-5);
  }
}















