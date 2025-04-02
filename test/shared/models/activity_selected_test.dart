import 'package:flutter_test/flutter_test.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';

final mockActivity = Activity(
  id: 0,
  name: 'Padel',
  description: 'Padel description',
  image: 'image',
  responsibleTrainer: 1,
  registeredPartners: [1, 2],
  classDay: 'Lunes',
  classHour: '10:00',
  trainer:  Trainer(
    id: 0,
    name: 'Pedro',
    lastNames: 'Perez',
    dni: '00000001',
    cv: '1234567',
    activities: [1, 2]
  )
);

final mockActivitySelected = ActivitySelected(
  activity: mockActivity,
  selected: false,
  hasMatches: false
);

void main() {
  group('Activity Selected', () {
    test('return correct instance Member copyWith', () {
      final mockActivitySelectedCopy = mockActivitySelected.copyWith();

      expect(
        mockActivitySelectedCopy,
        isA<ActivitySelected>()
            .having((w) => w.activity, 'activity', mockActivitySelected.activity)
            .having((w) => w.selected, 'selected', mockActivitySelectedCopy.selected)
            .having((w) => w.hasMatches, 'hasMatches', mockActivitySelectedCopy.hasMatches));
    });
  });
}