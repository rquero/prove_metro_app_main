import 'package:flutter_test/flutter_test.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';

final Map<String, dynamic> trainerJson = {
  "id": 12345,
  "name": 'Maria',
  "lastNames": 'Alvarez',
  "dni": '123456',
  "cv": '234562',
  "activities": [1, 2, 3],
};

void main() {
  group('Trainer', () {
    test('returns correct Trainer object', () {
      expect(
        Trainer.fromJson(trainerJson),
        isA<Trainer>()
            .having((w) => w.id, 'id', trainerJson['id'])
            .having((w) => w.name, 'name', trainerJson['name'])
            .having((w) => w.lastNames, 'lastNames', trainerJson['lastNames'])
            .having((w) => w.dni, 'dni', trainerJson['dni'])
            .having((w) => w.cv, 'cv', trainerJson['cv'])
            .having((w) => w.activities, 'activities', trainerJson['activities']));
    });
  });
}