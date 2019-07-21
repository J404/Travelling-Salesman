public ArrayList cities;
int cityCount;
Population pop;

void setup() {
  size(500, 500);
  background(255);
  
  cities = new ArrayList<City>();
  cityCount = 20;
  
  for (int i = 0; i < cityCount; i++) {
    cities.add(new City(random(500), random(500)));
  }
  
  pop = new Population(500, cityCount);
}


void draw() {
  background(255);
  for (int i = 0; i < cities.size(); i++) {
    City c = (City)cities.get(i);
    c.show();
  }
  
   pop.calculateFitness();
   pop.naturalSelection();
   pop.mutate();
  
  pop.showBest();
  
  fill(255, 0, 0);
  text(pop.gen, width - 30, 15);
}
