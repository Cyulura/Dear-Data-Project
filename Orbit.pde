import java.util.Map;

class Orbit
{
  int day;
  float radius;
  ArrayList<Record> records = new ArrayList<Record>();

  Orbit(int i_day, float i_radius)
  {
    day = i_day;
    radius = i_radius;
  }

  void draw()
  {
    noFill();
    stroke(0, 100);
    strokeWeight(sqrt(POINT_RADIUS / 2));

    circle(width/2, height/2, radius * 2);

    Record recordOnTop = recordPositions.keySet().toArray(new Record[0])[0];
    for (Record record : records)
    {
      if (record.highlight)
      {
         recordOnTop = record;
         continue;
      }
      record.draw();
    }
    
    if (recordOnTop != null) recordOnTop.draw();
  }
}
