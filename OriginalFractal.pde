void setup()
{
  size(1000,800);

}
void draw()
{
  background(55);
  treeThing(width/2, height-20, 90, 100, 36,1);
  cloudThing(width/2, 110, 150);
  cloudThing(width/6, 110, 150);
  cloudThing(width*5/6, 110, 150);
  smallerSquareThingLeft(50,500,100,100);
  smallerSquareThingRight(550,500,100,100);
}

void treeThing(int x1, int y1, double angle, double len, float strokee, int randomm)
{
  int x2 = x1 - (int)(Math.cos(Math.toRadians(angle)) * len);
  int y2 = y1 - (int)(Math.sin(Math.toRadians(angle)) * len);
  if(randomm % 3==0)
  {
  	stroke(255,0,0);
  	fill(255,0,0);
  	ellipse(x2,y2, 5, 5);
  }
  
  stroke(156,93,5);
  strokeWeight(strokee);
  line(x1, y1, x2, y2);
  //double randomm = Math.random();

  if(len > 5)
  {
    treeThing(x2, y2, angle-20, len-12, strokee/1.5, randomm+1);
    treeThing(x2, y2, angle+20, len-12, strokee/1.5, randomm+1);
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


void smallerSquareThingLeft(int x, int y, int widthh, int heightt)
{
  //fill(255,0,0);
  rect(x,y,widthh, heightt);
  //fill(0,255,0);
  rect(x,y+heightt/2,widthh,heightt/2);
  if(widthh > 15)
    smallerSquareThingLeft(x,y+heightt/2,widthh/2,heightt/2);
}

void smallerSquareThingRight(int x, int y, int widthh, int heightt)
{
  //fill(255,0,0);
  rect(x,y,widthh, heightt);
  //fill(0,255,0);
  rect(x,y+heightt/2,widthh,heightt/2);
  if(widthh > 15)
    smallerSquareThingRight(x+widthh/2,y+heightt/2,widthh/2,heightt/2);
}