class Question{
  String question;
  bool quesanswer;

  Question(String s, bool b)
  {
    question = s;
    quesanswer = b;
    if(b==true)
      print("You've chosen true as your answer . BUT UNFORTUNATELY U ARE RIGHT");
    else
      print("You've chosen false as your answer");
      
      
  }
}
