public class City {
  PVector pos;
  
  public City(float x, float y) {
    pos = new PVector(x, y);
  }
  
  public void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  public double getDistanceBetween(City b) {
    float xDist = Math.abs(pos.x - b.pos.x);
    float yDist = Math.abs(pos.y - b.pos.y);
    return Math.sqrt((xDist * xDist) + (yDist * yDist));
  }
}
