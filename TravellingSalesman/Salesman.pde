public class Salesman {
  ArrayList route;
  Brain brain;
  float fitness;
  float distance;
  
  public Salesman(int n) {
    brain = new Brain(n);
    route = brain.route;
    fitness = 0;
    distance = 0;
  }
  
  public void showRoute() {
    for (int i = 0; i < route.size(); i++) {
      stroke(0);
      City a = (City)route.get(i);
      if (i == route.size() - 1) {
        City b = (City)route.get(0);
        line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      } else {
        City b = (City)route.get(i + 1);
        line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      }
    }
  }
  
  public void calculateFitness() {
    float totalDistance = 0;
    
    for (int i = 0; i < route.size(); i++) {
      City a = (City)route.get(i);
      if (i == route.size() - 1) {
        City b = (City)route.get(0);
        totalDistance += (float)a.getDistanceBetween(b);
      } else {
        City b = (City)route.get(i + 1);
        totalDistance += (float)a.getDistanceBetween(b);
      }
    }
    
    distance = totalDistance;
    fitness = (1.0 / (totalDistance * totalDistance)) * 100000000;
  }
  
  public Salesman getBaby(Salesman b) {
    Salesman baby = new Salesman(route.size());
    baby.brain = brain.crossover(b.brain);
    return baby;
  }
  
}
