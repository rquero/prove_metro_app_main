import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';
import 'package:prove_metro_app_main/shared/repository/activities_repository.dart';
import 'package:prove_metro_app_main/shared/services/activity_service.dart';
import 'package:prove_metro_app_main/shared/services/trainer_service.dart';

class MockRepository extends Mock implements ActivitiesRepository {}
class MockActivityService extends Mock implements ActivityService {}
class MockTrainerService extends Mock implements TrainerService {}

late MockRepository mockRepository;
late MockActivityService mockActivityService;
late ActivitiesRepository activitiesRepository;
late MockTrainerService mockTrainerService;

final Trainer trainer = Trainer(
  id: 000001,
  name: 'Juan',
  lastNames: 'Lopez, Sanchez',
  dni: '1234567',
  cv: '123456',
  activities: []);

final Activity activity = Activity(
  id: 000001,
  name: 'Yoga',
  image: 'test',
  description: 'test',
  classDay: 'Lunes',
  classHour: '9:00',
  registeredPartners: [1, 2, 3],
  responsibleTrainer: 1,
  trainer: trainer,
);

final List<Activity> mockActivities = [activity];

void main() {
  setUp(() {
    mockActivityService = MockActivityService();
    mockTrainerService = MockTrainerService();

    activitiesRepository = ActivitiesRepository(
      activityService: mockActivityService,
      trainerService: mockTrainerService
    );
  });


  group('Group testing activities repository', () {
     
    test('Should call getAllActivities', () async {
      when(() => mockActivityService.getAllActivities()).thenAnswer(
        (_) => Future.value(mockActivities),
      );

      try {
        await activitiesRepository.getAllActivities();
      } catch (_) {}

      verify(() => mockActivityService.getAllActivities()).called(1);
    });

    test('should call getAllTrainers', () async {
      when(() => mockActivityService.getAllActivities()).thenAnswer(
        (_) => Future.value(mockActivities)
      );
      when(() => mockTrainerService.getAllTrainers()).thenAnswer(
        (_) => Future.value([trainer])
      );

      try {
        await activitiesRepository.getAllActivities();
      } catch (_) {}

      verify(() => mockTrainerService.getAllTrainers()).called(1);
    });

    test('should return activities list', () async {
      when(() => mockActivityService.getAllActivities()).thenAnswer(
        (_) => Future.value(mockActivities)
      );
      when(() => mockTrainerService.getAllTrainers()).thenAnswer(
        (_) => Future.value([trainer])
      );
      
      final actualActivities = await activitiesRepository.getAllActivities();

      expect(actualActivities, mockActivities);

    });

    test('should thrown exception when getAllActivities fails', () async {
      final exception = Exception('oops');
      
      when(() => mockActivityService.getAllActivities()).thenThrow(exception);

      expect(
        () async => activitiesRepository.getAllActivities(),
        throwsA(exception)
      );

    });

    test('should thrown exception when getAllTrainers fails', () async {
      final exception = Exception('oops');
      when(() => mockActivityService.getAllActivities()).thenAnswer(
        (_) => Future.value(mockActivities));

      when(() => mockTrainerService.getAllTrainers()).thenThrow(exception);

      expect(
        () async => activitiesRepository.getAllActivities(),
        throwsA(exception)
      );

    });

  });
  
}