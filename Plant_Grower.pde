import g4p_controls.*;

ArrayList<Plant> plants = new ArrayList<Plant>();
Sunflower hi = new Sunflower("Hi");
int midX = 300;
int groundLevel = 500;
int whichPlant = 0;

void setup() {
  size(600,600);
  createGUI();
  addNewPlantsWindow.setVisible(false);
  for(int i = 0; i < 5; i++) {
    plants.add(new Sunflower("sunflower"+i));
  }
}

void draw() {
  background(0);
  plants.get(whichPlant).grow();
}
