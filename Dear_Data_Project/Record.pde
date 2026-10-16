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
  String clockTime;
  int minutes;
  RecordType type;

  Record(int i_day, String i_clockTime, RecordType i_type)
  {
    day = i_day;
    clockTime = i_clockTime;
    minutes = clockTimeToMinutes();
    type = i_type;
  }

  int clockTimeToMinutes()
  {
    String[] splitString = split(clockTime, ":");
    int hour = Integer.parseInt(splitString[0]);
    int minute = Integer.parseInt(splitString[1]);

    return (hour * 60) + minute;
  }
}
