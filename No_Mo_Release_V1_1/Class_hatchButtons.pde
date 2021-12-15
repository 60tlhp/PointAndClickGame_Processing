class HatchButtons {
  float x, y, r;
  PShape button;
  boolean activated;


  public HatchButtons(float xPos, float yPos, float rad) {
    x = xPos;
    y = yPos;
    r = rad;
    activated = false;
  }

  public void drawPanelLights() {
    if (activated && scene7.counter <= 5) 
    {
      fill(220, 220, 0);
    } else if (activated && scene7.counter > 5)
    {
      fill(0, 220, 0);
    } else 
    {
      fill((x / width)*255, 0, 0);
    }
    //shape(button);
    ellipse(x, y, r, r);
  }

  public void drawHatchButtons() {
    //shape(button);
    ellipse(x, y, r, r);
  }

  public void setColor(color col) {
    button.setFill(col);
  }

  public PShape getShape() {
    return button;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getR() {
    return r;
  }
}
