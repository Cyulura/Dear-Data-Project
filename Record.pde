enum RecordType {
  VEHICLE,
    FOLIAGE,
    TRASH,
    LIQUID,
    ANIMAL,
    CELESTIAL_BODY,
    DEVICE,
    OTHER
}

class Position {
  public float x;
  public float y;
  
  Position(float xPos, float yPos)
  {
     x = xPos;
     y = yPos;
  }
}

class Record
{
  int day;
  String objectName;
  RecordType type;
  String clockTime;
  int minutes;
  boolean highlight = false;
  Position position;

  Record(int i_day, String i_objectName, RecordType i_type, String i_clockTime)
  {
    day = i_day;
    objectName = i_objectName;
    type = i_type;
    clockTime = i_clockTime;
    minutes = clockTimeToMinutes();
    
    // Position Calculation
    float xPos = width/2 + cos(2 * PI * ((float) minutes / DAY_IN_MINUTES) - DEG_90) * day * orbitSpacing;
    float yPos = width/2 + sin(2 * PI * ((float) minutes / DAY_IN_MINUTES) - DEG_90) * day * orbitSpacing;
    
    position = new Position(xPos, yPos);
    recordPositions.put(this, position);
  }

  int clockTimeToMinutes()
  {
    String[] splitString = split(clockTime, ":");
    int hour = Integer.parseInt(splitString[0]);
    int minute = Integer.parseInt(splitString[1]);

    return (hour * 60) + minute;
  }
  
  void draw()
  {
      fill(200, 255);
      noStroke();
      
      color recordColor = color(unhex(enumColors.get(type)));
      fill(recordColor);
      
      if (highlight)
      {
        stroke((brightness(recordColor) > 200 ? 0 : 255), 255);
        strokeWeight(2);
      }
      
      circle(position.x, position.y, POINT_RADIUS);
      noStroke();
      
      highlight = false;
  }
}
