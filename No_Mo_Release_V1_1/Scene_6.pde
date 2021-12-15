class Scene_6
{
  PFont font;
  PImage img1, img1_1, img2, img2_1;
  PShape buttonRight;
  float ButtonX, ButtonY, ButtonW = 60, ButtonH = 40;
  float portraitX = 80, portraitY = 140, portW = 140, portH=120;

  int scene6_status = 0; //0 = Room; 1 = Portrait


  Scene_6(PImage scene6_1_img, PImage scene6_1_1_img, PImage scene6_2_img, PImage scene6_2_1_img)
  {
    img1 = scene6_1_img;
    img1_1 = scene6_1_1_img;
    img2 = scene6_2_img;
    img2_1 = scene6_2_1_img;
  }

  Scene_6(PImage img) {
    img1 = img;
  }

  void display()
  {    
    if (!scene5.powerStatus)
    {
      switch(scene6_status)
      {
      case 0:
        img1.resize(width, height);
        image(img1, 0, 0);
        background(img1);
        noStroke();
        fill(255, 7);
        PShape portraitHighlight = createShape(ELLIPSE, portraitX + portW/2, portraitY + portH/2, portW, portH);
        shape(portraitHighlight);
        stroke(1);
        break;
      case 1:
        img1_1.resize(width, height);
        image(img1_1, 0, 0);
        background(img1_1);
        break;
      }
    }

    if (scene5.powerStatus)
    {
      switch(scene6_status)
      {
      case 0:
        img2.resize(width, height);
        image(img2, 0, 0);
        background(img2);
        noStroke();
        fill(255, 7);
        PShape portraitHighlight = createShape(ELLIPSE, portraitX + portW/2, portraitY + portH/2, portW, portH);
        shape(portraitHighlight);
        stroke(1);
        break;
      case 1:
        img2_1.resize(width, height);
        image(img2_1, 0, 0);
        background(img2_1);
        break;
      }
    }
  }

  void back() {
    //Left Button
    ButtonX = width - 20;
    ButtonY = height/2 +250;
    fill(30, 30, 160, 150);
    buttonRight = createShape(TRIANGLE, ButtonX, ButtonY, ButtonX - 60, ButtonY + 20, ButtonX - 60, ButtonY - 20);
    shape(buttonRight);
  }


  //Button collision
  boolean buttonPress(float mX, float mY)
  {
    if (mX >= ButtonX - 60 &&
      mX <= (ButtonX - 60) + ButtonW &&
      mY >= ButtonY - 20 &&
      mY <= (ButtonY - 20) + ButtonH)
    {
      return true;
    }
    return false;
  }

  boolean portraitPress(float mX, float mY) {
    {
      if (mX >= portraitX &&
        mX <= portraitX + portW &&
        mY >= portraitY  &&
        mY <= portraitY + portH)
      {
        return true;
      }
      return false;
    }
  }

  void Scene6ToScene4() {
    boolean ButtonClick = scene6.buttonPress(mouseX, mouseY);

    if (ButtonClick)
    {
      switch(scene6_status)
      {
      case 0:
        sceneNr = 4;
        break;
      case 1:
        scene6_status = 0;
        break;
      }
    }
  }

  void Scene6ToFamilyPortrait() {
    boolean portPress = portraitPress(mouseX, mouseY);

    if (portPress) {
      scene6_status = 1;
    }
  }
}
