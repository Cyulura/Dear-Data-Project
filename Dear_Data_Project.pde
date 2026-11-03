// Imports
import java.util.Map;

// Variables
Table data;
HashMap<Integer, Orbit> orbits;
HashMap<RecordType, String> enumColors = new HashMap<RecordType, String>();

void setup()
{
  size(800, 800);
  // Initialise
  orbits = new HashMap<Integer, Orbit>();
  
  // Colors
  enumColors.put(RecordType.valueOf("VEHICLE"), "ff363636");
  enumColors.put(RecordType.valueOf("FOLIAGE"), "ff4a2c15");
  enumColors.put(RecordType.valueOf("TRASH"), "ff4e692c");
  enumColors.put(RecordType.valueOf("LIQUID"), "ff3385ff");
  enumColors.put(RecordType.valueOf("ANIMAL"), "ffb5ff6b");
  enumColors.put(RecordType.valueOf("CELESTIAL_BODY"), "fffff540");
  enumColors.put(RecordType.valueOf("DEVICE"), "ffe37e3b");
  enumColors.put(RecordType.valueOf("OTHER"), "ff76ccb8");

  // Load Data
  data = loadTable("Data.csv", "header");
  
  for (TableRow row : data.rows())
  {
    int dayNumber = row.getInt("Day");
    String time = row.getString("Time");
    String objectName = row.getString("Name");
    RecordType type = RecordType.valueOf(row.getString("Type"));

    // Inserting Data
    orbits.putIfAbsent(dayNumber, new Orbit(dayNumber, 20 * dayNumber));
    orbits.get(dayNumber).records.add(new Record(dayNumber, objectName, type, time));
  }
}

void draw()
{
  background(255);
  
  // Key
  fill(0, 255);
  textAlign(LEFT, TOP);
  
  int startingY = 30;
  text("Key", 10, 10);
  
  for (Map.Entry<RecordType, String> entry : enumColors.entrySet())
  {
    String enumName = entry.getKey().name();
    fill(unhex(entry.getValue()));
    text(enumName, 10, startingY);
    startingY += 10;
  }
  
  for (Map.Entry<Integer, Orbit> entry : orbits.entrySet())
  {
    Orbit orbit = entry.getValue();
    orbit.draw();
  }
}
