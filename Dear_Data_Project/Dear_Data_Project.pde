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
  orbits.put(1, new Orbit(1, 50));

  // Load Data
  data = loadTable("Data.csv", "header");
  
  println("Hello");
  for (TableRow row : data.rows())
  {
    println(row);
    int dayNumber = row.getInt("Day");
    String time = row.getString("Time");
    RecordType type = RecordType.valueOf(row.getString("Type"));
    
    println(dayNumber);
    
    // Inserting Data
    orbits.putIfAbsent(dayNumber, new Orbit(dayNumber, 15 * dayNumber));
    orbits.get(dayNumber).records.add(new Record(dayNumber, time, type));
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
