import 'package:flutter_test/flutter_test.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';

final Map<String, dynamic> activityJson = {
  "id"                : 0,
  "name"              : 'Padel',
  "description"       : 'Padel description',
  "image"             : 'image',
  "responsibleTrainer": 1,
  "registeredPartners": [1, 2],
  "classDay"          : 'Lunes',
  "classHour"         : '10:00',
  "trainer"           : {
    "id": 0,
        "name": 'Pedro',
        "lastNames": 'Perez',
        "dni": '00000001',
        "cv": '1234567',
        "activities": [1, 2],
  }
  // "trainer"           : Trainer(
  //   id: 0,
  //   name: 'Pedro',
  //   lastNames: 'Perez',
  //   dni: '00000001',
  //   cv: '1234567',
  //   activities: []
  // )
};

void main() {
  group('Activity', () {
    group('fromJson', () {
      test('returns correct Activity object', () {
        expect(
          Activity.fromJson(activityJson),
          isA<Activity>()
              .having((w) => w.id, 'id', activityJson['id'])
              .having((w) => w.name, 'name', activityJson['name'])
              .having((w) => w.description, 'description', activityJson['description'])
              .having((w) => w.image, 'image', activityJson['image'])
              .having((w) => w.responsibleTrainer, 'responsibleTrainer', activityJson['responsibleTrainer'])
              .having((w) => w.registeredPartners, 'registeredPartners', activityJson['registeredPartners'])
              .having((w) => w.classDay, 'classDay', activityJson['classDay'])
              .having((w) => w.classHour, 'classHour', activityJson['classHour'])
        );
      });
    });
  });
}