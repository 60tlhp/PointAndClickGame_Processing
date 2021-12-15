class Menu
{
  PImage img;
  PShape startButton;
  float sButtonX, sButtonY, sButtonW = 400, sButtonH = 90;

  Menu(PImage Title_img)
  {
    img = Title_img;
  }

  void display()
  {
    //Game title
    img.resize(width, height);
    image(img, 0, 0);
    background(img);

    //Start button
    sButtonX = (width/3) + 14;
    sButtonY = (height/4 * 3) - 9;
  }

  //Button collision
  boolean buttonPress(float mX, float mY)
  {
    if (mX >= sButtonX &&
      mX <= sButtonX + sButtonW &&
      mY >= sButtonY &&
      mY <= sButtonY + sButtonH)
    {
      return true;
    }
    return false;
  }


  void MenuToScene1() {
    boolean ButtonClick = menu.buttonPress(mouseX, mouseY);

    if (ButtonClick)
    {
      sceneNr = 1;
    }
  }
}
