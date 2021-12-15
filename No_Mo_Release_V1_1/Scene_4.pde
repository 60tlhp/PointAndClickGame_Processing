import java.awt.*;
import java.awt.event.*;
import java.util.*;

String userPassword = "";
int number;
String password = "5037";
boolean isDoorOpen = false;

int scene4_status = 0; //0 = Power Off; 1 = Power On, Door closed; 2 = Monitor view; 3 = Power On, Door open 

class Scene_4
{
  PFont font;
  PImage img1, img2, img2_1, img3;
  PShape buttonLeft, pPanelButton, buttonForth, checkButton;
  float lButtonX, lButtonY, lButtonW = 60, lButtonH = 40;
  float pPButtonX, pPButtonY, pPButtonW = 300, pPButtonH = 315;
  float tButtonX, tButtonY, tButtonW = 40, tButtonH = 60;
  float cButtonX = width/2, cButtonY = height/2+100, cButtonW = 100, cButtonH = 30;
  float monitorX = 350, monitorY = 180, mWidth = 200, mHeight = 150;

  int scene4_status_temp;


  Scene_4(PImage scene4_1_img, PImage scene4_2_img, PImage scene4_2_1_img, PImage scene4_3_img)
  {
    img1 = scene4_1_img;
    img2 = scene4_2_img;
    img2_1 = scene4_2_1_img;
    img3 = scene4_3_img;
  }

  Scene_4(PImage img)
  {
    img2 = img;
  }

  Scene_4() 
  {
  }


  void display()
  {
    if (scene4_status_temp == 1)
    {
      scene4_status = scene4_status_temp;
      scene4_status_temp = 0;
    }

    switch(scene4_status)
    {
    case 0:
      img1.resize(width, height);
      image(img1, 0, 0);
      background(img1);
      break;
    case 1:
      img2.resize(width, height);
      image(img2, 0, 0);
      background(img2);
      break;
    case 2:
      img2_1.resize(width, height);
      image(img2_1, 0, 0);
      background(img2_1);
      enterPassword();
      break;
    case 3:
      img3.resize(width, height);
      image(img3, 0, 0);
      background(img3);
      break;
    }
  }

  void left()
  {
    //ButtonRight
    lButtonX = width/16 * 3;
    lButtonY = height/2;
    fill(30, 30, 160, 150);
    buttonLeft = createShape(TRIANGLE, lButtonX, lButtonY, lButtonX + 60, lButtonY + 20, lButtonX + 60, lButtonY - 20);
    shape(buttonLeft);
  }
  void right()
  {
    //Power Panel
    pPButtonX = width/40 * 31;
    pPButtonY = height/18;
    //fill(30,30,160,150);
    //pPanelButton = createShape(RECT, pPButtonX, pPButtonY, pPButtonW, pPButtonH);
    //shape(pPanelButton);
  }

  void forth()
  {
    if (scene4_status == 3)
    {
      //ButtonTop
      tButtonX = width/20 * 13 - 30;
      tButtonY = 320;
      fill(30, 30, 160, 150);
      buttonForth = createShape(TRIANGLE, tButtonX, tButtonY, tButtonX - 20, tButtonY + 60, tButtonX + 20, tButtonY + 60);
      shape(buttonForth);
    }
  }


  void checkButton() 
  {
    rect(cButtonX, cButtonY, cButtonW, cButtonH);
  }

  void enterPassword() 
  {
    try
    {
      if (userPassword.length() < 5)
      {
        for (int i = 0; i < userPassword.length(); i++) 
        {
          textSize(60);
          text("*", (width/3) + 100 + i*90, 360);
        }
      } else
      {
        for (int i = 0; i < 4; i++) 
        {
          textSize(60);
          text("*", width/3+i*110, 460);
        }
      }
    }

    catch(Exception e) 
    {
      text("Invalid Input", width/2, 600);
      e.printStackTrace();
    }
  }

  //Button collision
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

  //Button collision
  boolean pPButtonPress(float mX, float mY)
  {
    if (mX >= pPButtonX - 60 &&
      mX <= (pPButtonX - 60) + pPButtonW &&
      mY >= pPButtonY - 20 &&
      mY <= (pPButtonY - 20) + pPButtonH)
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


  boolean monitorPress(float mX, float mY) 
  {
    if (mX >= monitorX &&
      mX <= monitorX + mWidth &&
      mY >= monitorY  &&
      mY <= monitorY + mHeight &&
      scene4_status == 1)
    {
      return true;
    }
    return false;
  }

  boolean checkButtonPress(float mX, float mY) 
  {
    if (mX >= cButtonX &&
      mX <= cButtonX + cButtonW &&
      mY >= cButtonY  &&
      mY <= cButtonY + cButtonH)
    {
      return true;
    }
    return false;
  }



  void Scene4ToScene6() 
  {
    boolean lButtonClick = scene4.lButtonPress(mouseX, mouseY);

    if (lButtonClick && (scene4_status == 0 || scene4_status == 1 || scene4_status == 3))
    {
      sceneNr = 6;
    } else if(scene4_status == 2)
    {
      scene4_status = 1;
    }
  }

  void Scene4ToScene5() 
  {
    boolean rButtonClick = scene4.pPButtonPress(mouseX, mouseY);

    if (rButtonClick && (scene4_status == 0 || scene4_status == 1 || scene4_status == 3))
    {
      sceneNr = 5;
    }
  }

  void Scene4ToScene7() 
  {
    boolean tButtonClick = scene4.tButtonPress(mouseX, mouseY);

    if (tButtonClick)
    {
      sceneNr = 7;
    }
  }

  void Scene4ToMonitor()
  {
    if (scene4_status == 1)
    {
      boolean monitorClick = monitorPress(mouseX, mouseY);

      if (monitorClick)
      {
        scene4_status = 2;
      }
    }
  }

  void MonitorToScene4() 
  {
    boolean leftButtonPress = scene4.lButtonPress(mouseX, mouseY);

    if (leftButtonPress) 
    {
      sceneNr = 4;
    }
  }
}

boolean checkPassword(String userPassword) 
{
  if (userPassword.equals(password)) 
  {
    return true;
  }
  return false;
}



void keyPressed() 
{
  number = Character.getNumericValue(key);
  if (!(number == (-1)) && userPassword.length() < 4)
  {
    userPassword += Integer.toString(number);
  } else if (number == (-1)) 
  {
    if (checkPassword(userPassword)) 
    {
      //System.out.println("true");
      scene4_status = 3;
    } else if (!checkPassword(userPassword))
    {
      userPassword = "";
      //System.out.println("false");
    }
  }
}
