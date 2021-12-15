import java.util.Collections;

class Scene_2
{
  PFont font;
  PImage img;
  PShape buttonLeft, buttonRight, buttonTop;
  float lButtonX, lButtonY, lButtonW = 60, lButtonH = 40;
  float rButtonX, rButtonY, rButtonW = 60, rButtonH = 40;
  HatchButtons b1, b2, b3, b4;
  ArrayList<HatchButtons> buttons = new ArrayList<HatchButtons>();

  ArrayList<Integer> order = new ArrayList<Integer>();
  int counter = 2;
  boolean  open = false;
  boolean[] hbPressed = {false, false, false, false};

  Scene_2(PImage scene2_img)
  {
    img = scene2_img;
  }

  void display()
  {
    img.resize(width, height);
    image(img, 0, 0);
  }

  void hatchButtons() {

    b1 = new HatchButtons(width/2 + 3, (height/2 - 58), 25); //top
    b2 = new HatchButtons(width/2 + 5, (height/2 + 174), 25); // bottom
    b3 = new HatchButtons((width/2 - 110), (height/2 + 54), 25); //left
    b4 = new HatchButtons((width/2 + 115), (height/2 + 56), 25); //right
    Collections.addAll(buttons, b1, b4, b2, b3);
    Collections.addAll(order, 1, 2, 3, 4);

    try {
      for (int i = 0; i < buttons.size(); i++) {

        //check the collision on each buttons
        if (dist(mouseX, mouseY, buttons.get(i).getX(), buttons.get(i).getY()) < buttons.get(i).getR() && mousePressed) {

          if (buttons.indexOf(i) + counter == order.get(i)) { // check if index is equal to values in the array order

            counter++;
            hbPressed[i] = true;
          }
        }
        // condition is not met, then change every button white 
        if (!hbPressed[i]) { 
          fill(105, 105, 105, 80);
          // check if the right button is pressed then fill it black and the last button is a indicator, that the puzzle is solved
        } else if (hbPressed[i] && buttons.indexOf(i) + (counter - 1) == order.get(i))
        {
          if (counter > 5)
          {
            fill(0, 150, 0, 80);
          } else {
            fill(20, 80);
          }
        } else
        {
          fill(20, 80);
        }
        buttons.get(i).drawHatchButtons();
        // System.out.println(counter);
      }
    }
    catch(IndexOutOfBoundsException i) {
      if (counter > 5)
      {
        open = true;
        if (open) { 
          openingHatch();
        }
      }
    }
  }

  void back() {
    //Left Button
    lButtonX = 20;
    lButtonY = height/2 +250;
    fill(30,30,160);
    buttonLeft = createShape(TRIANGLE, lButtonX, lButtonY, lButtonX + 60, lButtonY + 20, lButtonX + 60, lButtonY - 20);
    shape(buttonLeft);
  }

  void openingHatch() {
    delay(50);
    sceneNr = 3;
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

  //rightButton Collision
  boolean rButtonPress(float mX, float mY)
  {
    if (mX >= rButtonX - 60 &&
      mX <= (rButtonX - 60) + rButtonW &&
      mY >= rButtonY - 20 &&
      mY <= (rButtonY - 20) + rButtonH)
    {
      return true;
    }
    return false;
  }

  //Scene transitions
  void Scene2ToScene3() {
    boolean rButtonClick = scene2.rButtonPress(mouseX, mouseY);

    if (rButtonClick)
    {
      sceneNr = 3;
    }
  }
  void Scene2ToScene1() {
    boolean lButtonClick = scene2.lButtonPress(mouseX, mouseY);

    if (lButtonClick)
    {
      sceneNr = 1;
    }
  }
}
