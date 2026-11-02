import 'models.dart';

// Загварт харагдах жишээ өгөгдөл. Жинхэнэ апп дээр сервер/өгөгдлийн сангаас ирнэ.

const userName = 'Zoltuya';
const userPhone = '99112233';
const userEmail = 'zoltuya@gmail.com';
const userPoints = 200;
const userRank = 3;

const categories = ['Бүгд', 'Боловсрол', 'Сонирхолтой', 'Спорт'];

const leaderboard = [
  Player('Тэмүүлэн', 165),
  Player('Саруул', 155),
  Player(userName, userPoints, isYou: true),
  Player('Номин', 135),
  Player('Ганаа', 120),
  Player('Оюка', 110),
];

const _mathQuestions = [
  Question('Хэрэв 2x + 5 = 15 бол x хэдтэй тэнцэх вэ?',
      ['x = 12', 'x = 5', 'x = 7', 'x = 24'], 1),
  Question('12 × 8 хэд вэ?', ['86', '96', '108', '98'], 1),
  Question('Гурвалжны дотоод өнцгүүдийн нийлбэр хэд вэ?',
      ['90°', '180°', '270°', '360°'], 1),
  Question(
      'Лиам Сарагаас 3 дахин олон алимтай. Лиам 18 алимтай бол Сара хэдэн алимтай вэ?',
      ['4 алим', '8 алим', '6 алим', '15 алим'], 2),
  Question('√81 хэд вэ?', ['7', '8', '9', '10'], 2),
];

const _generalQuestions = [
  Question('Монгол улсын нийслэл аль хот вэ?',
      ['Дархан', 'Эрдэнэт', 'Улаанбаатар', 'Чойбалсан'], 2),
  Question('Дэлхийн хамгийн том далай аль нь вэ?',
      ['Номхон далай', 'Атлантын далай', 'Энэтхэгийн далай', 'Хойд мөсөн далай'], 0),
  Question('Усны химийн томьёо аль нь вэ?', ['CO2', 'H2O', 'O2', 'NaCl'], 1),
  Question('Android үйлдлийн системийг аль компани хөгжүүлдэг вэ?',
      ['Apple', 'Microsoft', 'Google', 'Nokia'], 2),
  Question('Flutter-т ямар програмчлалын хэл ашигладаг вэ?',
      ['Java', 'Dart', 'Swift', 'Python'], 1),
];

const quizzes = [
  Quiz('Математик', 'quiz_math.png', 'Боловсрол', _mathQuestions),
  Quiz('Шинжлэх ухаан', 'quiz_science.png', 'Боловсрол', _generalQuestions),
  Quiz('Түүх', 'quiz_history.png', 'Боловсрол', _generalQuestions),
  Quiz('IQ Test', 'quiz_iq.png', 'Сонирхолтой', _mathQuestions),
  Quiz('Аялал', 'quiz_travel.png', 'Сонирхолтой', _generalQuestions),
  Quiz('Спорт', 'quiz_sport.png', 'Спорт', _generalQuestions),
];
