import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Question{
  final int id,answers;
  final String question;
  final List<String> options;
  RxBool isLiked = false.obs;
  Question(this.answers, this.question, this.options,{required this.id,});
}

class Option{
  late bool isAnswered = false;
  late int correctAns;
  late int selectedAns;
  Option(this.isAnswered,this.correctAns,this.selectedAns);
}

RxList<Question> sample_date = RxList.of([Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 1),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 2),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 3),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 4),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 5),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 6),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 7),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 8),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 9),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 10),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 11),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 12),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 13),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 14),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 15),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 16),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 17),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 18),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 19),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 20),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 21),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 22),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 23),Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 24),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 25),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 26),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 27),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 28),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 29),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 30),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 31),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 32),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 33),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 34),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 35),Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 36),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 37),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 38),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 39),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 40),]);