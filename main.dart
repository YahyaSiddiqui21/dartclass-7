import 'dart:io';
import 'dart:math';

class Quiz {
  final Map<String, String> questions;

  Quiz(this.questions);

  void start() {
    var rand = Random();
    var totalQuestions = 20;
    var correctAnswers = 0;

    List<int> randList = List.generate(
        totalQuestions, (index) => rand.nextInt(questions.length));

    for (int i = 0; i < totalQuestions; i++) {
      var randomIndex = randList[i];
      var question = questions.keys.elementAt(randomIndex);
      var answer = questions.values.elementAt(randomIndex);

      print("Question ${i + 1}: $question");
      var userAnswer = _askQuestion();

      if (userAnswer.toLowerCase() == answer.toLowerCase()) {
        correctAnswers++;
      }
    }

    var percentage = (correctAnswers / totalQuestions) * 100;

    print("Total Correct Answers: $correctAnswers");
    print("Percentage: $percentage%");

    if (percentage > 50) {
      print("Congratulations!");
    }

    _askToRestart();
  }

  String _askQuestion() {
    print("Your answer: ");
    return stdin.readLineSync() ?? "";
  }

  void _askToRestart() {
    print("Do you want to restart the quiz? (yes/no)");
    var restart = stdin.readLineSync()?.toLowerCase();
    if (restart == "yes") {
      start();
    } else {
      print("Goodbye!");
    }
  }
}

void main() {
  var questions = {
    "What is the capital of France?": "Paris",
    "How many planets are in our solar system?": "8",
    "What is the largest mammal in the world?": "Blue whale",
    "Who wrote 'Romeo and Juliet'?": "William Shakespeare",
    "What is the chemical symbol for gold?": "Au",
    "Which gas do plants absorb from the atmosphere?": "Carbon dioxide",
    "What is the tallest mountain in the world?": "Mount Everest",
    "What is the largest organ in the human body?": "Skin",
    "What is the currency of Japan?": "Yen",
    "Who painted the Mona Lisa?": "Leonardo da Vinci",
    "What is the capital of Japan?": "Tokyo",
    "What is the symbol for the element oxygen?": "O",
    "What is the largest desert in the world?": "Sahara Desert",
    "What is the national flower of India?": "Lotus",
    "In which year did Christopher Columbus first arrive in the Americas?":
        "1492",
    "What is the powerhouse of the cell?": "Mitochondria",
    "Who wrote 'The Great Gatsby'?": "F. Scott Fitzgerald",
    "What is the smallest planet in our solar system?": "Mercury",
    "Which gas makes up the majority of Earth's atmosphere?": "Nitrogen",
    "What is the chemical symbol for water?": "H2O",
    // Add more questions here
  };

  var quiz = Quiz(questions);
  quiz.start();
}
