class Question{

  final String questionText;
  final List<Answer> answersList ;

  Question(this.questionText, this.answersList);
}

class Answer {
  
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List <Question> getQuestions(){
List <Question> list=[];
 list.add(
    
    Question("Which 2 teams play in The Barcelona Derby?" , 
    [
      Answer('Barcelona & Espanyol' , true ),
      Answer('Barcelona & Real Madrid' , false ),
      Answer('Barcelona & Atletico Madrid' , false ),
      Answer('Barcelona & Villarreal' , false ),
    ],
    ));

    list.add(
    Question("how many times messi won ballon d'or ?" , 
    [
      Answer('6' , false),
      Answer('7' , false ),
      Answer('8' , true ),
      Answer('9' , false ),
    ],
    ));

     list.add(
    Question("How many teams play in the group stages of the UEFA Champions League?" , 
    [
      Answer('30' , false ),
      Answer("31" , false ),
      Answer('32' , true),
      Answer('33' , false ),
    ],
    ));

    list.add(
    Question("Which English club was the first to win the European Cup twice? " , 
    [
      Answer('Arsenal' , false ),
      Answer('Liverpool' , true ),
      Answer('West Ham' , false ),
      Answer('Manchester City' , false ),
    ],
    ));

    list.add(
    Question("Which nation has won the African Cup of Nations the most?" , 
    [
      Answer('Egypt ' , true ),
      Answer('Ghana ' , false ),
    ],
    ));

    list.add(
    Question("How often is the FIFA World Cup?" , 
    [
      Answer('Every 2 years ' , false ),
      Answer('Every 3 years ' , false ),
      Answer('Every 4 years ' , true ),
    ],
    ));

    list.add(
    Question("How many countries have won the World Cup?" , 
    [
      Answer('6' , false ),
      Answer('8' , true ),
      Answer('10' , false ),
      Answer('12' , false ),
    ],
    ));

    list.add(
    Question("The FIFA world cup is the most watched sports event in the world " , 
    [
      Answer('True' , true ),
      Answer('False' , false ),
    ],
    ));

    list.add(
    Question("Who won the UEFA Europ Championship in 2020?" , 
    [
      Answer('France' , false ),
      Answer('Italy' , true ),
      Answer('England' , false ),
      Answer('Germany' , false ),
    ],
    ));

    list.add(
    Question("What was the first country to win the World Cup of Football?" , 
    [
      Answer('Germany' , false ),
      Answer('Italy' , false ),
      Answer('Uruguay' , true ),
      Answer('Argentina' , false ),
    ],
    ));
return list;


}