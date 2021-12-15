int scene5_status = 0; //0 = room; 1 = portrait

class Scene_5
{
  PFont font;
  PImage img1, img2;
  PShape buttonLeft, buttonPower;
  PShape[] powerLights = new PShape[4];
  float lButtonX, lButtonY, lButtonW = 60, lButtonH = 40, pButtonX, pButtonY, pButtonD = 100, pLightsX, pLightsY, pLightsD = 40;
  boolean powerStatus = false;
  int timer = 0, lightDelay = 20, timerMax = lightDelay * 4;

  Scene_5(PImage scene5_1_img, PImage scene5_2_img)
  {
      img1 = scene5_1_img;
      img2 = scene5_2_img;
  }

  void display()
  {
    if(!powerStatus)
    {
    img1.resize(width, height);
    image(img1, 0, 0);
    background(img1);
    }

    if(powerStatus)
    {
    img2.resize(width, height);
    image(img2, 0, 0);
    background(img2);
    }
  }

  void back() {
    //Left Button
    lButtonX = 20;
    lButtonY = height/2 + 250;
    fill(30,30,160,150);
    buttonLeft = createShape(TRIANGLE, lButtonX, lButtonY, lButtonX + 60, lButtonY + 20, lButtonX + 60, lButtonY - 20);
    shape(buttonLeft);
  }

  void power() {
    //Power Button
    pButtonX = (width/5 * 4 - 142);
    pButtonY = (height/4 * 3) + 27;
    if (pbuttonPress(mouseX, mouseY) && mousePressed)
    {
      fill(0, 0, 0, 80);
    } else
    {
      fill(130, 0, 0, 80);
    }
    buttonPower = createShape(ELLIPSE, pButtonX, pButtonY, pButtonD, pButtonD);
    shape(buttonPower);

    //Power Lights
    pLightsX = pButtonX;
    pLightsY = pButtonY - 110;

    for (int i = 0; i < 4; i++)
    {
      if (timer >= lightDelay * (i + 1))
      {
        if (timer == timerMax)
        {
          fill(0, 220, 0, 100);
        } else
        {
          fill(220, 220, 0, 100);
        }
      } else
      {
        fill(0, 0, 0, 100);
      }
      powerLights[i] = createShape(ELLIPSE, pLightsX, pLightsY - (81 * i), pLightsD, pLightsD);
      shape(powerLights[i]);
    }
    fill(255);
  }

  //Button collision
  boolean lbuttonPress(float mX, float mY)
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

  boolean pbuttonPress(float mx, float my)
  {
    float distX = mx - pButtonX;
    float distY = my - pButtonY;
    float distance = sqrt((distX * distX) + (distY * distY));
    if (distance <= pButtonD/2)
    {
      return true;
    }
    return false;
  }

  void Scene5ToScene4() {
    boolean ButtonClick = scene5.lbuttonPress(mouseX, mouseY);

    if (ButtonClick)
    {
      sceneNr = 4;
    }
  }

  void PowerOn()
  {
    boolean ButtonClick = scene5.pbuttonPress(mouseX, mouseY);
    if (ButtonClick && mousePressed && timer < timerMax)
    {
      timer++;
      if (timer >= timerMax)
      {
        powerStatus = true;
        scene4.scene4_status_temp = 1;
      }
    } else if (!mousePressed && timer < timerMax)
    {
      if (timer > 0)
      {
        timer -= 15;
      } else if (timer <= 0)
      {
        timer = 0;
      }
    }
  }
}
