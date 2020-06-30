ArrayList<PVector> points;
ArrayList<PVector> velocities;

int MAX_POINTS = 500;

void setup()
{
  size(640,480);
  points = new ArrayList<PVector>();
  velocities = new ArrayList<PVector>();
}

void draw()
{
  background(0);
  update();
  stroke(255);
  for( int i = 1; i < points.size(); i++ )
  {
    line(points.get(i-1).x, points.get(i-1).y,
    points.get(i).x, points.get(i).y);
  }
}

void update()
{
  points.add(new PVector(mouseX, mouseY));
  velocities.add(new PVector(0, -1));
  if( points.size() > MAX_POINTS )
  {
    points.remove(0);
    velocities.remove(0);
  }
  
  //add velocities
  for( int i = 0; i < points.size(); i++)
  {
    points.set(i, points.get(i).add(velocities.get(i)));
  }
  
}
