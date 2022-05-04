class Button{
  float x1, x2; // xy coordinated of the buttons
  float y1, y2;
  float diameter; // if the button is a circle
  boolean isEllipse;
  boolean start;
  
  public Button(float xcord, float ycord, float dia){ // if it is a rectangle
    this.x1 = xcord;
    this.y1 = ycord;
    this.isEllipse = true; 
    this.diameter = dia;
  }
  public Button(float xc1, float yc1, float xc2, float yc2){ // If it is a triangle
    this.x1 = xc1;
    this.x2 = xc2;
    this.y1 = yc1;
    this.y2 = yc2;
    this.isEllipse = false;
  }
  public Button(float xc1, float yc1, float xc2, float yc2, boolean start){
    this.x1 = xc1;
    this.x2 = xc2;
    this.y1 = yc1;
    this.y2 = yc2;
    this.isEllipse = false;
    this.start = start;
  }
  void pack(int r, int g, int b){ // generate button
    fill(r, g, b);
    if (this.isEllipse == true){
    ellipse(this.x1, this.y1, this.diameter, this.diameter);
    
    } else {
    rectMode(CORNERS);
    rect(this.x1, this.y1, this.x2, this.y2);
    rectMode(CORNER);
    }
  }
   boolean overButton(){ // if over button
     if(this.isEllipse){ // copied from processing 
       float disX = this.x1 - mouseX;
       float disY = this.y1 - mouseY;
        if (sqrt(sq(disX) + sq(disY)) < this.diameter/2 ) {
        return true;
       }
      
     } else { // copied from processing
       if (mouseX >= this.x1 && mouseX <= this.x2 && 
        mouseY >= this.y1 && mouseY <= this.y2) {
        return true;
     }
     
   }
   return false;
}
   void label(String t){ // Make a button label
     fill(0);
     textSize(20);
     if(!this.isEllipse) { 
     text(t, x1 + x1/25, (y1 + y2)/2 +y1/25);
   } else {
     text(t, x1 - this.diameter/2, y1);
   
   }
   
   }
}
