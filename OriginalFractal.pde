public void setup()
{
	size(600,600);
	//rectMode(CENTER);
}
public void draw()
{
	background(0);
	myFractal(20,0, 550, 600);
}
public void myFractal(int x, int y, int myLength, int myHeight)
{
	rect(x,y,myLength,myHeight);
	if(myHeight > 10)
	{
		myFractal(x,y+myHeight/2, myLength, myHeight/2);
		myFractal(x,y+myHeight/2, myLength/2, myHeight/2);
	}
}

/*
http://rosettacode.org/wiki/Fractal_tree#Java
*/