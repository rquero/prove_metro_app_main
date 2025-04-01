import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:prove_metro_app_main/core/constants/api_constant.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';

class TrainerService {
  String baseApi = 'resources/response_calls';

  Future<List<Trainer>> getAllTrainers() async {
    try {
      String response = await rootBundle.loadString(ApiConstant.getTrainers);
      final List<dynamic> data = json.decode(response);
      final List<Trainer> trainers = data.map((trainer) => Trainer.fromJson(trainer)).toList();

      return trainers;
    } catch (e) {
      throw Exception('error loading trainers');
    }
  }

  Future<Trainer> getTrainerById(int id) async {
    try {
      final List<Trainer> trainersList = await getAllTrainers();
      final Trainer trainerFound = trainersList.firstWhere((trainer) => trainer.id == id);

      return trainerFound;

    } catch (err) {
      throw Exception('error finding trainer by id');
    }
  }
}