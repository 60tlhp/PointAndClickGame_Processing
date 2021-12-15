class End_Screen
{
  PImage end;
  
  End_Screen(PImage end_scene)
  {
    end = end_scene;
  }

  void display()
  {
    end.resize(width, height);
    image(end, 0, 0);
    background(end);
  }
}
