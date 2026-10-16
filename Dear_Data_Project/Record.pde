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

class Record
{
  int day;
  String objectName;
  RecordType type;
  String clockTime;
  int minutes;

  Record(int i_day, String i_objectName, RecordType i_type, String i_clockTime)
  {
    day = i_day;
    objectName = i_objectName;
    type = i_type;
    clockTime = i_clockTime;
    minutes = clockTimeToMinutes();
  }

  int clockTimeToMinutes()
  {
    String[] splitString = split(clockTime, ":");
    int hour = Integer.parseInt(splitString[0]);
    int minute = Integer.parseInt(splitString[1]);

    return (hour * 60) + minute;
  }
}
