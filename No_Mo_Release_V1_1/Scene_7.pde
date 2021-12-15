import java.util.*;

int scene7_status = 0; //0 = Puzzle unsolved; 1 = Puzzle solved

class Scene_7
{
  PFont font;
  PImage img1, img1_1, img2;
  PShape buttonLeft, buttonTop;
  float lButtonX, lButtonY, lButtonW = 60, lButtonH = 40;
  float tButtonX, tButtonY, tButtonW = 40, tButtonH = 60;
  HatchButtons[]buttons = new HatchButtons[6];
  HatchButtons[]lights = new HatchButtons[6];
  String order = "143652";
  String buttonOrder = "";
  float colX = 985, colY = 190, colW = 150, colH = 80;
  int counter = 0;
  int scene7_status = 0; //0 = Capsule closed; 1 = Control Panel; 2 = Capsule Open
  boolean panel_status = false; //false = Not done; true = Done

  Scene_7(PImage scene7_1_img, PImage scene7_1_1_img, PImage scene7_2_img)
  {
    img1 = scene7_1_img;
    img1_1 = scene7_1_1_img;
    img2 = scene7_2_img;
    int distance = 0;
    setButtonsAndLights(buttons, 300, 335, distance, 40);
    setButtonsAndLights(lights, 295, 450, distance, 35);
  }

  void display()
  {
    switch(scene7_status)
    {
    case 0:
      img1.resize(width, height);
      image(img1, 0, 0);
      background(img1);
      break;
    case 1:
      img1_1.resize(width, height);
      image(img1_1, 0, 0);
      background(img1_1);
      PShape[] pButtons = new PShape[6];
      for (int i = 0; i < 6; i++)
      {
        fill(255, 15);
        pButtons[i] = createShape(ELLIPSE, buttons[i].getX() - 3, buttons[i].getY(), buttons[i].getR() * 2, buttons[i].getR() * 2); 
        shape(pButtons[i]);
      }
      break;
    case 2:
      img2.resize(width, height);
      image(img2, 0, 0);
      background(img2);
      break;
    }
  }

  void back() {
    //Left Button
    lButtonX = 20;
    lButtonY = height/2 +250;
    fill(30, 30, 160, 150);
    buttonLeft = createShape(TRIANGLE, lButtonX, lButtonY, lButtonX + 60, lButtonY + 20, lButtonX + 60, lButtonY - 20);
    shape(buttonLeft);
  }

  void forth() {
    //Top Button
    tButtonX = width/2;
    tButtonY = height/8;
    fill(30, 30, 160, 150);
    buttonTop = createShape(TRIANGLE, tButtonX, tButtonY, tButtonX + 20, tButtonY + 60, tButtonX - 20, tButtonY + 60);
    shape(buttonTop);
  }

  void panel() {
    for (int i=0; i<buttons.length; i++) {

      if (dist(mouseX, mouseY, buttons[i].getX(), buttons[i].getY()) < buttons[i].getR() && mousePressed) {

        if (!(buttonOrder.contains(Integer.toString(i+1)))) { 
          buttonOrder += Integer.toString(i+1);

          if (buttonOrder.charAt(counter) == order.charAt(counter)) {
            lights[counter].activated = true;
            counter++;
          } else {
            buttonOrder = "";
            counter = 0;

            for (int j = 0; j<buttons.length; j++) {
              lights[j].activated = false;
            }
          }
        } else if (buttonOrder.equals(order)) {
          panel_status = true;
        }
      }
      lights[i].drawPanelLights();
    }
  }

  void setButtonsAndLights(Object[]obj, int x, int y, int distance, int size) {
    for (int i=0; i<obj.length; i++) {
      obj[i] = new HatchButtons(x+distance, y, size);
      distance+=140;
    }
  }



  //Button collision
  boolean lButtonPress(float mX, float mY)
  {
    if (mX >= lButtonX &&
      mX <= lButtonX + lButtonW &&
      mY >= lButtonY - 20 &&
      mY <= (lButtonY - 20) + lButtonH)
    {
      return true;
    }
    return false;
  }


  boolean controllPanelPress(float mX, float mY) {
    if (mX >= colX &&
      mX <= colX + colW &&
      mY >= colY  &&
      mY <= colY + colH)
    {
      return true;
    }
    return false;
  }

  //Button collision
  boolean tButtonPress(float mX, float mY)
  {
    if (mX >= tButtonX - 20 &&
      mX <= (tButtonX - 20) + tButtonW &&
      mY >= tButtonY &&
      mY <= tButtonY + tButtonH)
    {
      return true;
    }
    return false;
  }

  void Scene7ToScene4() {
    boolean lButtonClick = scene7.lButtonPress(mouseX, mouseY);

    if (lButtonClick)
    {
      switch(scene7_status)
      {
      case 0:
        sceneNr = 4;
        break;
      case 1:
        if (!panel_status)
        {
          scene7_status = 0;
        } else
        {
          scene7_status = 2;
        }
        break;
      case 2:
        sceneNr = 4;
        break;
      }
    }
  }

  void Scene7ToEndScene() {
    boolean tButtonClick = scene7.tButtonPress(mouseX, mouseY);

    if (tButtonClick)
    {
      sceneNr = 10;
    }
  }

  void Scene7ToPanel() {
    boolean panelPress = controllPanelPress(mouseX, mouseY);
    if (panelPress) {
      scene7_status = 1;
    }
  }
}
