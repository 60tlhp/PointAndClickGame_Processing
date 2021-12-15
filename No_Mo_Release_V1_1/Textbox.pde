class Textbox
{
  PImage txt_img;
  float textboxX = 290, textboxY = 470, textboxW = 990, textboxH = 250;

  Textbox(PImage textbox_img)
  {
    txt_img = textbox_img;
  }

  void display()
  {
    txt_img.resize(width, height);
    image(txt_img, 0, 0);
  }

  void enableText()
  {
    textboxOpen = true;
  }

  void advanceText()
  {
    textboxNr += 1;
  }

  boolean textboxPress(float mX, float mY)
  {
    if (mX >= textboxX &&
      mX <= (textboxX) + textboxW &&
      mY >= textboxY &&
      mY <= textboxY + textboxH)
    {
      return true;
    }
    return false;
  }
}
