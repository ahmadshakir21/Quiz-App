import 'package:flutter_application/src/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(questions: "What is the capital of iraq ? ", answers: {
    "Erbil": false,
    "Baghdad": true,
    "basra": false,
    "najaf": false
  }),
  QuestionModel(questions: "What is the capital of turkey ? ", answers: {
    "Ankara": true,
    "Istanbul": false,
    "GaziAntep": false,
    "Adana": false
  }),
  QuestionModel(questions: "What is the capital of iran ? ", answers: {
    "Mashhad": false,
    "Orumiyeh": false,
    "Tabrez": false,
    "Tehran": true
  }),
  QuestionModel(questions: "What is the capital of qatar ? ", answers: {
    "Al Salwa": false,
    "Doha": true,
    "Ar rayyan": false,
    "Al Khor": false
  }),
  QuestionModel(questions: "What is the capital of Bahrain ? ", answers: {
    "Manama": true,
    "Awale": false,
    "Jurdab": false,
    "Al Wasmiyah": false
  }),
  QuestionModel(questions: "What is the capital of Yemen ? ", answers: {
    "Al Jawf": false,
    "Hadhramaut": false,
    "Sanha": true,
    "Abyan": false
  }),
  QuestionModel(
      questions: "What is the capital of saudi arabia ? ",
      answers: {"Riyadh": true, "Arar": false, "Yanbu": false, "Jizan": false}),
  QuestionModel(questions: "What is the capital of egypt ? ", answers: {
    "Cairo": true,
    "Aswan": false,
    "Siwa": false,
    "Ismailia": false
  }),
];
