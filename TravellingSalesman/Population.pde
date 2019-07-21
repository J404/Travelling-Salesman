public class Population {
  ArrayList pop;
  int size, bestIndex, gen;
  float fitnessSum;
  
  public Population(int size, int n) {
    this.size = size;
    bestIndex = 0;
    gen = 1;
    pop = new ArrayList<Salesman>();
    for (int i = 0; i < size; i++) {
      pop.add(new Salesman(n));
    }
  }
  
  public void calculateFitness() {
    for (int i = 0; i < size; i++) {
      Salesman s = (Salesman)pop.get(i);
      s.calculateFitness();
    }
  }
  
  public void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i < size; i++) {
      Salesman s = (Salesman)pop.get(i);
      fitnessSum += s.fitness;
    }
  }
  
  public void naturalSelection() {
    ArrayList newGen = new ArrayList<Salesman>();
    calculateFitnessSum();
    selectBest();
    
    newGen.add((Salesman)pop.get(bestIndex));
    for (int i = 1; i < size; i++) {
      Salesman parentA = selectParent();
      Salesman parentB = selectParent();
      
      newGen.add(parentA.getBaby(parentB));
    }
    
    pop = newGen;
    gen++;
  }
  
  public Salesman selectParent() {
    float runningSum = 0.0;
    float rand = random(fitnessSum);
    
    for (int i = 0; i < size; i++) {
      Salesman s = (Salesman)pop.get(i);
      runningSum += s.fitness;
      if (rand < runningSum) {
        return s;
      }
    }
    
    return null;
  }
  
  public void mutate() {
    for (int i = 1; i < size; i++) {
      Salesman s = (Salesman)pop.get(i);
      s.brain.mutate();
    }
  }
  
  public void selectBest() {
    float maxFit = 0.0;
    for (int i = 0; i < size; i++) {
      Salesman s = (Salesman)pop.get(i);
      if (s.fitness > maxFit) {
        maxFit = s.fitness;
        bestIndex = i;
      }
    }
    Salesman best = (Salesman)pop.get(bestIndex);
    System.out.println(best.fitness + " " + best.distance);
  }
  
  public void showBest() {
    Salesman s = (Salesman)pop.get(bestIndex);
    s.showRoute();
  }
}
