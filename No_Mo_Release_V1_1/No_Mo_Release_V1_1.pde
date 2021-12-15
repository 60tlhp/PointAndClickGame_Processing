import processing.sound.*;
//export JVM_ARGS="-Xms1024m - Xms1024m";
//-----------------------------
//|         Variables         |
//-----------------------------
SoundFile BGM, vo_1, vo_2, vo_3; //1 = medium; 2 = short; 3 = long


Menu menu;
Scene_1 scene1;
Scene_2 scene2;
Scene_3 scene3;
Scene_4 scene4;
Scene_5 scene5;
Scene_6 scene6;
Scene_7 scene7;
Textbox textbox;
End_Screen endScreen;

int sceneNr = 0, textboxNr = 0;
int textboxStatus = 0; //0 = closed; 1 = in progress; 2 = done, set to 0
PImage Title;
PImage scene1_img;
PImage scene2_img;
PImage scene3_img;
PImage scene4_1_img, scene4_2_img, scene4_2_1_img, scene4_3_img;
PImage scene5_1_img, scene5_1_1_img, scene5_2_img;
PImage scene6_1_img, scene6_1_1_img, scene6_2_img, scene6_2_1_img;
PImage scene7_1_img, scene7_1_1_img, scene7_2_img;
PImage end_scene;  
PImage[] textbox_img = new PImage[13];
//PImage textbox1_img, textbox2_img, textbox3_img, textbox4_img, textbox5_img, textbox6_img, textbox7_img, textbox8_img, textbox9_img, textbox10_img, textbox11_img, textbox12_img;
int userInput;
boolean textboxOpen = false, txt1 = false, txt2 = false, txt3 = false, txt4 = false, txt5 = false, txt6 = false, txt7 = false, txt8 = false, txt9 = false;
//-----------------------------
//|          Setup            |
//-----------------------------
void setup()
{
  size(1280, 720, FX2D);

  //Title
  Title = loadImage("first_contact_img/title_scene.png");
  menu = new Menu(Title);
  //Scene_1
  scene1_img = loadImage("first_contact_img/scene1.png");
  scene1 = new Scene_1(scene1_img);
  //Scene_2
  scene2_img = loadImage("first_contact_img/scene2.png");
  scene2 = new Scene_2(scene2_img);
  //Scene_3
  scene3_img = loadImage("first_contact_img/scene3.png");
  scene3 = new Scene_3(scene3_img);
  //Scene_4
  scene4_1_img = loadImage("first_contact_img/scene4.1.png");
  scene4_2_img = loadImage("first_contact_img/scene4.2.png");
  scene4_2_1_img = loadImage("first_contact_img/scene4.2.1.png");
  scene4_3_img = loadImage("first_contact_img/scene4.3.png");
  scene4 = new Scene_4(scene4_1_img, scene4_2_img, scene4_2_1_img, scene4_3_img);
  //Scene_5
  scene5_1_img = loadImage("first_contact_img/scene5.1.png");
  scene5_2_img = loadImage("first_contact_img/scene5.2.png");
  scene5 = new Scene_5(scene5_1_img, scene5_2_img);
  //Scene_6
  scene6_1_img = loadImage("first_contact_img/scene6.1.png");
  scene6_1_1_img = loadImage("first_contact_img/scene6.1.1.png");
  scene6_2_img = loadImage("first_contact_img/scene6.2.png");
  scene6_2_1_img = loadImage("first_contact_img/scene6.2.1.png");
  scene6 = new Scene_6(scene6_1_img, scene6_1_1_img, scene6_2_img, scene6_2_1_img);
  //Scene_7
  scene7_1_img = loadImage("first_contact_img/scene7.1.png");
  scene7_1_1_img = loadImage("first_contact_img/scene7.1.1.png");
  scene7_2_img = loadImage("first_contact_img/scene7.2.png");
  scene7 = new Scene_7(scene7_1_img, scene7_1_1_img, scene7_2_img);
  //End scene
  end_scene = loadImage("first_contact_img/end_scene.png");
  endScreen  = new End_Screen(end_scene);

  //Textboxes
  textbox_img[0] = loadImage("first_contact_img/textbox_1.png");
  textbox_img[1] = loadImage("first_contact_img/textbox_2.png");
  textbox_img[2] = loadImage("first_contact_img/textbox_3.png");
  textbox_img[3] = loadImage("first_contact_img/textbox_4.png");
  textbox_img[4] = loadImage("first_contact_img/textbox_5.png");
  textbox_img[5] = loadImage("first_contact_img/textbox_6.png");
  textbox_img[6] = loadImage("first_contact_img/textbox_7.png");
  textbox_img[7] = loadImage("first_contact_img/textbox_8.png");
  textbox_img[8] = loadImage("first_contact_img/textbox_9.png");
  textbox_img[9] = loadImage("first_contact_img/textbox_10.png");
  textbox_img[10] = loadImage("first_contact_img/textbox_11.png");
  textbox_img[11] = loadImage("first_contact_img/textbox_12.png");
  textbox_img[12] = loadImage("first_contact_img/textbox_13.png");

  //sound
  vo_1 = new SoundFile(this, "sound/Nommo_voice_1.mp3");
  vo_2 = new SoundFile(this, "sound/Nommo_voice_2.mp3");
  vo_3 = new SoundFile(this, "sound/Nommo_voice_3.mp3");
  BGM = new SoundFile(this, "sound/Samurai_Jack_OST_-_Underwater_music_mp3cut.net.mp3");
  BGM.loop();
}

//-----------------------------
//|           Draw            |
//-----------------------------
void draw()
{
  background(180);

  //Scene display
  switch(sceneNr) 
  {
  case 0: 
    menu.display();
    break;
  case 1:
    scene1.display();
    if (!txt1)
    {
      textboxOpen = true;
      txt1 = true;
      textboxNr = 0;
      vo_3.play();
    }
    if (textboxNr > -1 && textboxNr <= 3)
    {
      if (textboxNr == 3)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!textboxOpen)
    {
      scene1.forth();
    }
    break;
  case 2:
    scene2.display();
    if (!txt2)
    {
      textboxOpen = true;
      txt2 = true;
      textboxNr = 3;
      vo_2.play();
    }
    if (textboxNr > 2 && textboxNr <= 4)
    {
      if (textboxNr == 4)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!textboxOpen)
    {
      scene2.back();
      scene2.hatchButtons();
    }
    break;
  case 3:
    scene3.display();
    scene3.backAndForth();
    break;
  case 4:
    scene4.display();
    if (!txt3)
    {
      textboxOpen = true;
      txt3 = true;
      textboxNr = 4;
      vo_1.play();
    }
    if (textboxNr > 3 && textboxNr <= 5)
    {
      if (textboxNr == 5)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!txt6 && scene5.powerStatus)
    {
      textboxOpen = true;
      txt6 = true;
      textboxNr = 8;
      vo_1.play();
    }
    if (textboxNr > 7 && textboxNr <= 9)
    {
      if (textboxNr == 9)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!textboxOpen)
    {
      scene4.left();
      scene4.right();
      scene4.forth();
    }
    break;
  case 5:
    scene5.display();
    if (!txt4)
    {
      textboxOpen = true;
      txt4 = true;
      textboxNr = 7;
      vo_1.play();
    }
    if (textboxNr > 6 && textboxNr <= 8)
    {
      if (textboxNr == 8)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!textboxOpen)
    {
      scene5.back();
      scene5.power();
      scene5.PowerOn();
    }
    break;
  case 6:
    scene6.display();
    if (!txt5)
    {
      textboxOpen = true;
      txt5 = true;
      textboxNr = 5;
      vo_2.play();
    }
    if (textboxNr > 4 && textboxNr <= 6 && !txt7)
    {
      if (textboxNr == 6)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!txt7 && scene6.scene6_status == 1)
    {
      textboxOpen = true;
      txt7 = true;
      textboxNr = 6;
      vo_2.play();
    }
    if (textboxNr > 5 && textboxNr <= 7)
    {
      if (textboxNr == 7)
      {
        textboxStatus = 2;
      }
      switchText();
    }
    if (!textboxOpen)
    {
      scene6.back();
    }
    break;
  case 7:
    scene7.display();
    if (!txt9 && scene7.scene7_status == 2)
    {
      textboxOpen = true;
      txt9 = true;
      textboxNr = 10;
      vo_3.play();
    }
    if (textboxNr > 9 && textboxNr <= 13)
    {
      if (textboxNr == 13)
      {
        textboxStatus = 2;
      }
      switchText();
    }

    if (!txt8)
    {
      textboxOpen = true;
      txt8 = true;
      textboxNr = 9;
      vo_1.play();
    }
    if (textboxNr > 8 && textboxNr <= 10 && !txt9)
    {
      if (textboxNr == 10)
      {
        textboxStatus = 2;
      }
      switchText();
    }

    if (!textboxOpen)
    {
      if (scene7.scene7_status == 0 || scene7.scene7_status == 1)
      {
        if (scene7.scene7_status == 1)
        {
          scene7.panel();
        }
        scene7.back();
      }
      if (scene7.scene7_status == 2)
      {
        scene7.forth();
      }
    }
    break;
  case 10:
    endScreen.display();
    break;
  }
}

void switchText()
{
  switch(textboxStatus)
  {
  case 0:
    if (textboxOpen)
    {
      textboxStatus = 1;
    }
    break;
  case 1:
    textbox = new Textbox(textbox_img[textboxNr]);
    textbox.display();
    break;
  case 2:
    textboxStatus = 0;
    textboxOpen = false;
    break;
  }
}

//sceneNr change
void mouseReleased() {
  if (textboxOpen)
  {
    textbox.advanceText();
  }

  switch(sceneNr) 
  {
  case 0: 
    menu.MenuToScene1();
    break;
  case 1:
    scene1.Scene1ToScene2();
    break;
  case 2:
    scene2.Scene2ToScene1();
    scene2.Scene2ToScene3();
    break;
  case 3:
    scene3.Scene3ToScene1();
    scene3.Scene3ToScene4();
    break;
  case 4:
    scene4.Scene4ToScene5();
    scene4.Scene4ToScene6();
    scene4.Scene4ToScene7();
    if (!textboxOpen)
    {
      scene4.Scene4ToMonitor();
    }
    break;
  case 5:
    scene5.Scene5ToScene4();
    break;
  case 6:
    scene6.Scene6ToScene4();
    if (!textboxOpen)
    {
      scene6.Scene6ToFamilyPortrait();
    }
    break;
  case 7:
    scene7.Scene7ToScene4();
    if (!textboxOpen)
    {
      scene7.Scene7ToPanel();
    }
    scene7.Scene7ToEndScene();
    break;
  }
}
