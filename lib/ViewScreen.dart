// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/models/Question.dart';

// ignore: camel_case_types
class quizSreen extends StatefulWidget {
  const quizSreen({super.key});


  @override
  State<quizSreen> createState() => _quizSreenState();
}

// ignore: camel_case_types
class _quizSreenState extends State<quizSreen> {

  List <Question> questionList = getQuestions();
  int currentQuestion = 0;
  int score = 0;
  Answer? selectAnswer;


  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Simple Quiz App ' ,
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(
              width: 250,
              height: 20,
              child: Divider(
                color: Colors.black,
                thickness: 2.5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            _questionWidget(),
            _answerList(),
            const SizedBox(
              height: 40,
            ),
            _nextButton(),
            
          ],
        ),
    );
  }

_questionWidget() {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Text('   Question ${currentQuestion + 1} / ${questionList.length.toString()} ' ,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      ),
      const SizedBox(
        height: 9,
      ),
      Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Text(questionList[currentQuestion].questionText , 
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  ),
                ),
                const Positioned(
                  top: 45,
                  left: -30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                const Positioned(
                  top: 45,
                  right: -30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                const Positioned(
                  bottom: 120,
                  left: 165,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.check , size: 45,
                    color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            )
    ],
  );
}
_answerList(){
  return Column(
    children:
      questionList[currentQuestion].answersList.map((e) =>  _answerButton(e),
      ).toList(),
  );
 }

 Widget _answerButton (Answer answer){

  bool isSelected = answer == selectAnswer;

  return Container(
    width: 260,
    height: 50,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton(
      onPressed: () { 

        if (selectAnswer == null) {
          if (answer.isCorrect) {
            score= score + 10;
          }
        }
        setState(() {
          selectAnswer = answer;
        });
       },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: isSelected? Colors.amberAccent : Colors.lightBlueAccent,
        foregroundColor: isSelected? Colors.white : Colors.black,
      ),
      child: Text(answer.answerText),
    ),
  );
 }

 _nextButton(){

  bool isLastQuestion = false;
  if(currentQuestion == questionList.length-1){
    isLastQuestion = true;
  }
  return Container(
    width: 230,
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton(
      onPressed: () { 
        if (isLastQuestion) {
          showDialog(context: context, builder: (_) => _showScore());
        }
        else if(selectAnswer == null)
        {
          setState(() {
            currentQuestion = currentQuestion;
          });
        }
        else 
        {
          setState(() {
            selectAnswer == Answer;
          currentQuestion ++;
          });
          
        }
       },
      style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.red,
        foregroundColor:  Colors.white,
      ),
      child: Text(isLastQuestion ? "Finished" : "Next",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      ),
    ),

  );
 }

 _showScore(){
  
  return AlertDialog(
    title: Center(
      child: Text('Your Score  :  $score / ${10*(questionList.length)}',
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      ),
    ),
    content: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
      onPressed: () {  
        setState(() {
        Navigator.pop(context);
        currentQuestion = 0;
        score = 0;
        selectAnswer = null;
        
        });
      },
      child: const Text('Restart' ,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      ),
    ),
  );
 }
}