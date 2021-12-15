class Scene_3
{
  PFont font;
  PImage img;
  PShape buttonLeft, buttonDown;
  float lButtonX, lButtonY, lButtonW = 60, lButtonH = 40;
  float dButtonX, dButtonY, dButtonW = 40, dButtonH = 60;
  ;


  Scene_3(PImage scene3_img)
  {
    img = scene3_img;
  }

  void display()
  {

    img.resize(width, height);
    image(img, 0, 0);
  }

  void backAndForth() {
    //ButtonLeft
    lButtonX = 20;
    lButtonY = height/2 +250;
    fill(30,30,160);
    buttonLeft = createShape(TRIANGLE, lButtonX, lButtonY, lButtonX + 60, lButtonY + 20, lButtonX + 60, lButtonY - 20);
    shape(buttonLeft);

    //ButtonDown
    dButtonX = width/2 + 30;
    dButtonY = height/2 + 180;
    fill(30,30,160,150);
    buttonDown = createShape(TRIANGLE, dButtonX, dButtonY, dButtonX + 20, dButtonY - 60, dButtonX - 20, dButtonY - 60);
    shape(buttonDown);
  }


  //Left Button collision
  boolean lButtonPress(float mX, float mY)
  {
    if (mX >= lButtonX &&
      mX <= (lButtonX) + lButtonW &&
      mY >= lButtonY - 20 &&
      mY <= (lButtonY - 20) + lButtonH)
    {
      return true;
    }
    return false;
  }

  //Top Button collision
  boolean dButtonPress(float mX, float mY)
  {
    if (mX >= dButtonX - 20 &&
      mX <= (dButtonX - 20) + dButtonW &&
      mY >= dButtonY - 60 &&
      mY <= (dButtonY - 60) + dButtonH)
    {
      return true;
    }
    return false;
  }


  void Scene3ToScene1() {
    boolean lButtonClick = scene3.lButtonPress(mouseX, mouseY);

    if (lButtonClick)
    {
      sceneNr = 1;
    }
  }

  void Scene3ToScene4() {
    boolean dButtonClick = scene3.dButtonPress(mouseX, mouseY);

    if (dButtonClick)
    {
      sceneNr = 4;
    }
  }
}
