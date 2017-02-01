void setup()
{
  size(700,700);
}
void draw()
{
  background(55);
  repeatThing(width/2, height-20, 90, 100);
}

void repeatThing(int x1, int y1, double angle, double len)
{
  int x2 = x1 - (int)(Math.cos(Math.toRadians(angle)) * len);
  int y2 = y1 - (int)(Math.sin(Math.toRadians(angle)) * len);
  stroke(255,0,0);
  line(x1, y1, x2, y2);
  if(len > 10)
  {
    repeatThing(x2, y2, angle-20, len-12);
    repeatThing(x2, y2, angle+20, len-12);
  }
  
}