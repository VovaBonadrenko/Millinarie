class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  final String hint;

  Question(
    this.question,
    this.answers,
    this.correctAnswerIndex,
    this.hint,
  );
}

final question1 = Question('Яка країна межує з Україною?',
    ['Словаччина', 'США', 'Марокко', 'Бразилія'], 0, 'Точно не орки');

final question2 = Question(
    'Скільки кольорів у веселці?', ['5', '6', '7', '8'], 2, 'Більше 1');

final question3 = Question(
    'В якому році Україна стала незалежною, суверенною державою?',
    ['2014', '988', '1991', '2022'],
    2,
    'більше 1990');

final question4 = Question('2+2*2=?',
    ['9', '6', '4', '8'], 1, 'Перевернута 9');

final question5 = Question('Сучасна столиця України?',
    ['Карпати', 'Київ', 'Канада', 'Канів'], 1, 'Починається на К');

final question6 = Question('Скільки планет в нашій галактиці?',
    ['8', '1', '4', '10'], 0, 'точно не 1');


final question7 = Question('Де знаходиться найбільша гора України?',
    ['Карпати', 'Лосантос', 'Львів', 'Мукачево'], 0, 'На заході України');

final question8 = Question('В якому фільму знімався Джоні Деб?',
    ['Чорна пантера', 'Робокоп', 'Пірати Карібського моря', 'Американський психопат'], 2, 'Був піратом');

final question9 = Question('Яка студія зняла фільм "Стражи галактики"?',
    ['Disney', 'DS', 'Sony', 'Marvel'], 3, 'Я єсть Грут!');


final questions = [question1, question2, question3
  ,question4,question5,question6,question7,question8,question9];
