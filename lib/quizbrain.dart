import 'Question.dart';

class QuizBrain{
  int _qcount = 0;
  bool isgood = true;
  List <Question>_Questions = [
    Question("M&M stands for Mars and Moordale",false),
    Question("A lion's roar can be heard up to eight kilometres away",true),
    Question("There are 219 episodes of Friends",false),
    Question("'A' is the most common letter used in the English language",false),
    Question("ASOS stands for As Seen On Screen",true),
    Question("K is worth four points in Scrabble",false),
    Question("Australia is wider than the moon",true),
    Question("Madonna's real name is Madonna",true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('Google was originally called \"Backrub\".', true),
  ];
  void nextquestion()
  {
    if(_qcount == 0 && isgood == false)
      {
        isgood = true;
      }
    if(_qcount<_Questions.length-1)
      {
        _qcount++;
      }
    else
      {
        isgood = false;
        _qcount = 0;
      }
  }
  String getQuestion()=>_Questions[_qcount].question;
  bool getAns() => _Questions[_qcount].quesanswer;

}