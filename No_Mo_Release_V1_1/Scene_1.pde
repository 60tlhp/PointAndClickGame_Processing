class Scene_1
{
  PFont font;
  PImage img;
  PShape continueButton;
  float ButtonX, ButtonY, ButtonW = 40, ButtonH = 60;

  Scene_1(PImage scene1_img)
  {
    img = scene1_img;
  }

  void display()
  {

    img.resize(width, height);
    image(img, 0, 0);
    background(img);
  }

  void forth() {
    ButtonX = (width/4 * 3 - 70);
    ButtonY =  290;
    fill(30,30,160);
    continueButton = createShape(TRIANGLE, ButtonX, ButtonY, ButtonX - 20, ButtonY - 60, ButtonX + 20, ButtonY - 60);
    shape(continueButton);
  }


  //Button collision
  boolean buttonPress(float mX, float mY)
  {
    if (mX >= ButtonX - 20 &&
      mX <= (ButtonX - 20) + ButtonW &&
      mY >= ButtonY - 60 &&
      mY <= (ButtonY - 60) + ButtonH)
    {
      return true;
    }
    return false;
  }

  void Scene1ToScene2() {
    boolean ButtonClick = scene1.buttonPress(mouseX, mouseY);

    if (ButtonClick)
    {
      sceneNr = 2;
    }
  }
}
