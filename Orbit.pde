import java.util.Map;

class Orbit
{
  int day;
  float radius;
  ArrayList<Record> records = new ArrayList<Record>();

  static final int DAY_IN_MINUTES = 24 * 60;
  static final int POINT_RADIUS = 10;

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

    for (Record record : records)
    {
      fill(200, 255);
      noStroke();

      float xPos = width/2 + cos(2 * PI * ((float) record.minutes / DAY_IN_MINUTES) - DEG_90) * radius;
      float yPos = height/2 + sin(2 * PI * ((float) record.minutes / DAY_IN_MINUTES) - DEG_90) * radius;
      
      fill(color(unhex(enumColors.get(record.type))));
      circle(xPos, yPos, POINT_RADIUS);
    }
  }
}
