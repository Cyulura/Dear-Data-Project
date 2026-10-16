class Orbit
{
  int day;
  float radius;
  ArrayList<Record> records = new ArrayList<Record>();
  
  static final int DAY_IN_MINUTES = 24 * 60 * 60;

  Orbit(int i_day, float i_radius)
  {
    day = i_day;
    radius = i_radius;
  }

  void draw()
  {
    noFill();
    stroke(0);
    strokeWeight(1);

    circle(width/2, height/2, radius);
    
    for (Record record : records)
    {
     fill(200);
     noStroke();
     circle(width/2 + cos(radians(2*PI*(record.clockTimeToMinutes() / DAY_IN_MINUTES))), height/2 + sin(radians(2*PI*(record.clockTimeToMinutes() / DAY_IN_MINUTES))), 10);
    }
  }
}
