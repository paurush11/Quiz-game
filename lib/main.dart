import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain q = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My-Quiz-App"),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon> score = [];
  int finalscore = 0;
  void checkans(bool val)
  {
    setState(() {
      if(val == q.getAns())
      {
        score.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        finalscore++;
      }
      else
      {
        score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      q.nextquestion();
      if(!q.isgood)
        {
          if(finalscore > 9)
            {
              Alert(
                context: context,
                type: AlertType.success,
                title: "Passed Exam",
                desc: "Your Score is $finalscore",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Requiz",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: (){
                      finalscore = 0;
                      Navigator.pop(context);
                    },
                      gradient: LinearGradient(colors: [
                      Color.fromRGBO(16, 176, 9, 1.0),
                      Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                      width: 120,
                      ),

                  DialogButton(
                      child: Text(
                      "Exit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => SystemNavigator.pop(),
                      gradient: LinearGradient(colors: [
                      Colors.deepOrange,
                      Color.fromRGBO(170, 8, 9, 1.0)
                    ]),
                    width: 120,
                  )
                ],
              ).show();

            }
          else
            {
              Alert(
                context: context,
                type: AlertType.error,
                title: "Failed Exam",
                desc: "Your Score is $finalscore",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Requiz",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: (){
                      finalscore = 0;
                      Navigator.pop(context);
                    },
                    width: 120,
                  ),
                  DialogButton(
                    child: Text(
                      "Exit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => SystemNavigator.pop(),
                    width: 120,
                  )
                ],
              ).show();
              finalscore = 0;
            }

          score.clear();
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkans(true);

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               checkans(false);
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: score

        ),
      ],
    );
  }
}


