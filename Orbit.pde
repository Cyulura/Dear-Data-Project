import java.util.Map;

// Colors


class Orbit
{
  int day;
  float radius;
  ArrayList<Record> records = new ArrayList<Record>();

  static final int DAY_IN_MINUTES = 24 * 60;
  static final int POINT_RADIUS = 10;
  static final float DEG_90 = PI / 2;

  Orbit(int i_day, float i_radius)
  {
    day = i_day;
    radius = i_radius;
  }

  void draw()
  {
    noFill();
    stroke(0, 255);
    strokeWeight(sqrt(POINT_RADIUS / 2));

    //println(radius);
    circle(width/2, height/2, radius * 2);

    for (Record record : records)
    {
      fill(200, 255);
      noStroke();

      float xPos = cos(2 * PI * ((float) record.minutes / DAY_IN_MINUTES) - DEG_90) * radius;
      float yPos = sin(2 * PI * ((float) record.minutes / DAY_IN_MINUTES) - DEG_90) * radius;
      
      fill(color(unhex(enumColors.get(record.type))));
      circle(width/2 + xPos, height/2 + yPos, POINT_RADIUS);
    }
  }
}
