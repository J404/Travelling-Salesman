import java.util.Collections;

public class Brain {
  ArrayList route = new ArrayList<City>();
  
  public Brain(int n) {
    setRoute(n);
  }
  
  public void setRoute(int n) {
    ArrayList newCities = cities;
    Collections.shuffle(newCities);
    for (int i = 0; i < n; i++) {
      route.add(newCities.get(i));
    }
  }
  
  public Brain crossover(Brain b) {
    float midpoint = random(route.size());
    Brain newBrain = new Brain(route.size());
    
    for (int i = 0; i < route.size(); i++) {
      if (i < midpoint) {
        newBrain.route.set(i, route.get(i));
      } else {
        newBrain.route.set(i, b.route.get(i));
      }
    }
    
    return newBrain;
  }
  
  public void mutate() {
    float mutationRate = 0.2;
    float rand = random(1);
    
    for (int i = 0; i < route.size(); i++) {
      if (rand < mutationRate) {
        int newIndex = (int)random(route.size());
        City current = (City)route.get(i);
        City next = (City)route.get(newIndex);
        route.set(newIndex, current);
        route.set(i, next);
      }
    }
  }
}
