import 'dart:core';
import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Category {
  final String name;
  final int id;
  late int questionCorrect = 0;
  late int questionCount = 0;
  Category({required this.name, required this.id});
  Category.fromJson(Map<String, dynamic> map)
      : this.name = map["name"],
        this.id = map["id"];

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "id": this.id,
    };
  }
}

class Question {
  final int id, answers;
  final String question;
  final Category category;
  final List<dynamic> options;
  final String? image;
  RxBool isLiked = false.obs;
  RxBool isCorrect = false.obs;
  Question(
    this.answers,
    this.question,
    this.options,
    this.image, {
    required this.category,
    required this.id,
  });

  Question.fromJson(Map<String, dynamic> map)
      : this.id = map["id"],
        this.category = Category.fromJson(map["category"]),
        this.answers = map["answers"],
        this.question = map["question"],
        this.options = map["options"],
        this.image = map["image"],
        this.isLiked = RxBool(map["isLiked"]),
        this.isCorrect = RxBool(map["isCorrect"]);

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "answers": this.answers,
        "question": this.question,
        "options": this.options,
        "image": this.image,
        "isLiked": this.isLiked.value,
        "isCorrect": this.isCorrect.value,
        "category": this.category
      };
}

class Option {
  late RxBool isAnswered = false.obs;
  late RxInt correctAns;
  late RxInt selectedAns;
  Option(this.isAnswered, this.correctAns, this.selectedAns);
}

RxList<Question> sample_date = RxList.from([
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 1,
      category: Category(id: 1, name: "Rules Of The Road")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 2, category: Category(id: 2, name: "Responsible Driving")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 3, category: Category(id: 3, name: "Managing Risk")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 4, category: Category(id: 4, name: "Control of Vehicle")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 5, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 6, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 7, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 8, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 9, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 10, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 11, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 12, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like dick", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 13, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like puss", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 14, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like food", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 15, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 16, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 17, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 18, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 19, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 20, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 21, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 22, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 23, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 24,
      category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like dick", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 25, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like puss", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 26, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like food", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 27, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 28, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 29, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 30, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 31, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 32, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 33, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 34, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 35, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 36, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 37, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 38, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 39, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 40, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 41,
      category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 42, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 43, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 44, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 45, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 46, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 47, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 48, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 49, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 50, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 51, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 52, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 53, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 54, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 55, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 56, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 57, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 58, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 59, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 60, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 61, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 62, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 63, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 64,
      category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 65, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 66, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 67, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 68, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 69, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 70, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"],
      "assets/sample.jpeg",
      id: 71, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 72, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 73, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 74, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 75, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 76, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 77, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 78, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 79, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 80, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 81,
      category: Category(id: 4, name: "Technical Matters")),
  Question(
      2, "Do you like dick", ["yes", "no", "yes", "no"], "assets/sample.jpeg",
      id: 82, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 83, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 84, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 85, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 86, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 87, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 88, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 89, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 90, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 91, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 92, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 93, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 94, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 95, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 96, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 97, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 98, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 99, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 100, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 101, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 102, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 103, category: Category(id: 4, name: "Technical Matters")),
  Question(
      2,
      "What should a drive do before towign a caravan",
      [
        "Ensure all passengers are securely seated in the caravan.",
        "Have an extended mirror fitted to the driver sides door of the vehicle only.",
        "Have extended mirrors fitted to the towing vehicle.",
        "Ensure that only adult passengers are seated in the caravan."
      ],
      null,
      id: 104,
      category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like dick", ["yes", "no", "yes", "no"], null,
      id: 105, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like puss", ["yes", "no", "yes", "no"], null,
      id: 106, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like food", ["yes", "no", "yes", "no"], null,
      id: 107, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 108, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 109, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 110, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 111, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 112, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 113, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 114, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 115, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 116, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 117, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 118, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 119, category: Category(id: 4, name: "Technical Matters")),
  Question(2, "Do you like chocolate", ["yes", "no", "yes", "no"], null,
      id: 120, category: Category(id: 4, name: "Technical Matters")),
]);
