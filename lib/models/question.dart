import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Question{
  final int id,answers;
  final String question;
  final List<String> options;
  RxBool isLiked = false.obs;
  RxBool isCorrect = false.obs;
  Question(this.answers, this.question, this.options,{required this.id,});
}

class Option{
  late RxBool isAnswered = false.obs;
  late RxInt correctAns;
  late RxInt selectedAns;
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
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 40),Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 41),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 42),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 43),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 44),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 45),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 46),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 47),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 48),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 49),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 50),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 51),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 52),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 53),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 54),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 55),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 56),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 57),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 58),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 59),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 60),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 61),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 62),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 63),Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 64),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 65),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 66),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 67),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 68),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 69),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 70),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 71),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 72),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 73),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 74),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 75),Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 76),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 77),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 78),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 79),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 80),Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 81),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 82),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 83),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 84),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 85),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 86),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 87),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 88),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 89),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 90),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 91),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 92),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 93),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 94),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 95),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 96),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 97),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 98),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 99),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 100),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 101),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 102),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 103),Question(2, "What should a drive do before towign a caravan", ["Ensure all passengers are securely seated in the caravan.","Have an extended mirror fitted to the driver sides door of the vehicle only.","Have extended mirrors fitted to the towing vehicle.","Ensure that only adult passengers are seated in the caravan."], id: 104),
  Question(2, "Do you like dick", ["yes","no","yes","no"], id: 105),
  Question(2, "Do you like puss", ["yes","no","yes","no"], id: 106),
  Question(2, "Do you like food", ["yes","no","yes","no"], id: 107),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 108),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 109),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 110),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 111),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 112),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 113),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 114),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 115),Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 116),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 117),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 118),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 119),
  Question(2, "Do you like chocolate", ["yes","no","yes","no"], id: 120),]);