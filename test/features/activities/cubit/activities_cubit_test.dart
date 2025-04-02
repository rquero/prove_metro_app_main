import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';
import 'package:prove_metro_app_main/shared/repository/activities_repository.dart';

class MockActivitiesRepository extends Mock implements ActivitiesRepository {}
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

final List<ActivitySelected> mockActivitiesSelected = [
  ActivitySelected(
    activity: activity,
    selected: true, hasMatches: false)
];
void main () {

  group('activities cubit', () {
    late MockActivitiesRepository mockActivitiesRepository;
    late ActivitiesCubit activitiesCubit;

    setUp(() async {
      mockActivitiesRepository = MockActivitiesRepository();

      when(
        () => mockActivitiesRepository.getActivitiesUser()
      ).thenAnswer((_) => Stream.value(mockActivities));
      activitiesCubit = ActivitiesCubit(mockActivitiesRepository);
      when(
        () => mockActivitiesRepository.saveActivity(activity)
      ).thenAnswer((_) => Future.value(mockActivities));
      activitiesCubit = ActivitiesCubit(mockActivitiesRepository);
      when(
        () => mockActivitiesRepository.getAllActivities()
      ).thenAnswer((_) => Future.value(mockActivities));

      activitiesCubit = ActivitiesCubit(mockActivitiesRepository);

    });

    // blocTest('emits [ActivitiesState] when is init',
    //   build: () => ActivitiesCubit(mockActivitiesRepository),
    //   expect: () => [ isA<ActivitiesState>()]
    // );
   
  });
}