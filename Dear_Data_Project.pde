// Imports
import java.util.Map;

// Variables
Table data;
HashMap<Integer, Orbit> orbits = new HashMap<Integer, Orbit>();
HashMap<RecordType, String> enumColors = new HashMap<RecordType, String>();
int orbitSpacing = 20;
int fontSize = 14;
int padding = 15;

float maximumWidth;
String currentMouseTime = "";

// Constants
float DEG_90 = PI / 2;
int DAY_IN_MINUTES = 24 * 60;

void setup()
{
  size(800, 800);
  // Initialise

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
    orbits.putIfAbsent(dayNumber, new Orbit(dayNumber, orbitSpacing * dayNumber));
    orbits.get(dayNumber).records.add(new Record(dayNumber, objectName, type, time));
  }
}

void draw()
{
  background(255);

  // Key
  textAlign(LEFT, TOP);
  textSize(fontSize);

  fill(128, 100);
  rectMode(CORNER);
  rect(padding, padding, maximumWidth + padding, (enumColors.size()) * fontSize + padding * 2, 10, 0, 10, 0);

  fill(0, 255);
  text("Key", padding + 5, padding + 5);

  int startingY = padding + 5;

  for (Map.Entry<RecordType, String> entry : enumColors.entrySet())
  {
    String enumName = entry.getKey().name();
    fill(unhex(entry.getValue()));
    text(enumName, padding + 5, padding + 5 + startingY);

    maximumWidth = max(maximumWidth, textWidth(enumName));
    startingY += fontSize;
  }

  for (Map.Entry<Integer, Orbit> entry : orbits.entrySet())
  {
    Orbit orbit = entry.getValue();
    orbit.draw();
  }

  // Render Times
  fill(0, 255);
  int outerRingRadius = orbitSpacing * orbits.size() + padding * 2;
  for (float i = 0; i < 24; i++)
  {
    String timeText = String.format("%02d:00", (int)i);
    float xPos = width/2 + cos(2 * PI * i/24 - DEG_90) * outerRingRadius;
    float yPos = height/2 + sin(2 * PI * i/24 - DEG_90) * outerRingRadius;

    textAlign(CENTER, CENTER);

    rectMode(CENTER);
    fill(128, 100);
    rect(xPos, yPos, textWidth(timeText) + 5, fontSize + 5, 5);

    fill(0, 255);
    text(timeText, xPos, yPos);
  }

  // Show current time relative to mouse position
  fill(0, 255);
  textAlign(RIGHT, BOTTOM);
  text(currentMouseTime, width - padding, height - padding);
}

void displayRelativeTime()
{
  float relativeX = mouseX - width/2;
  float relativeY = mouseY - height/2;

  float angle = 2 * PI - (atan2(relativeX, relativeY) + PI);
  float minutes = DAY_IN_MINUTES * (angle / (2 * PI));

  int hours = floor(minutes / 60);
  currentMouseTime = String.format("%02d:%02d", hours, (int) minutes % 60);
}

void mouseMoved()
{
  displayRelativeTime();
}

void mouseDragged()
{
  displayRelativeTime();
}
