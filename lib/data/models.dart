class Question {
  final String text;
  final List<String> options;
  final int answer; // зөв хариултын индекс
  const Question(this.text, this.options, this.answer);
}

class Quiz {
  final String title, image, category;
  final List<Question> questions;
  const Quiz(this.title, this.image, this.category, this.questions);
}

class Player {
  final String name;
  final int points;
  final bool isYou;
  const Player(this.name, this.points, {this.isYou = false});
}
