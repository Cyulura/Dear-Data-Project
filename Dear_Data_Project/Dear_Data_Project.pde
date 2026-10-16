// Imports
import java.util.Map;

// Variables
Table data;
HashMap<Integer, Orbit> orbits;

void setup()
{
  size(800, 800);
  // Initialise
  orbits = new HashMap<Integer, Orbit>();

  // Load Data
  data = loadTable("Data.csv", "header");
  
  println("Hello");
  for (TableRow row : data.rows())
  {
    int dayNumber = row.getInt("Day");
    String time = row.getString("Time");
    String objectName = row.getString("Name");
    RecordType type = RecordType.valueOf(row.getString("Type"));

    // Inserting Data
    orbits.putIfAbsent(dayNumber, new Orbit(dayNumber, 50 * dayNumber));
    orbits.get(dayNumber).records.add(new Record(dayNumber, objectName, type, time));
  }
}

void draw()
{
  background(255);
  for (Map.Entry<Integer, Orbit> entry : orbits.entrySet())
  {
    Orbit orbit = entry.getValue();
    orbit.draw();
  }
}
