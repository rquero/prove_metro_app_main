import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
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
      // final expected = true; // Define the expected value
      // when(
      //   () => mockActivitiesRepository.saveActivity(activity)
      // ).thenAnswer((_) => Stream.value(mockActivities));
      // activitiesCubit = ActivitiesCubit(mockActivitiesRepository);
      when(
        () => mockActivitiesRepository.getAllActivities()
      ).thenAnswer((_) => Future.value(mockActivities));

      activitiesCubit = ActivitiesCubit(mockActivitiesRepository);

    });

    // test('initial state is correct', () {
    //   final activitiesCubit = ActivitiesCubit(mockActivitiesRepository);
    //   expect(activitiesCubit.state, ActivitiesState());
    // });

    blocTest('emits [ActivitiesState] when is init',
      build: () => ActivitiesCubit(mockActivitiesRepository),
      expect: () => [ isA<ActivitiesState>()]
    );

    blocTest('emits [ActivitiesState] when is added',
      build: () => ActivitiesCubit(mockActivitiesRepository),
      act: (bloc) => bloc.addActivity(activity),
      expect: () => [
        // isA<ActivitiesState>()
        // .having(
        //   (p0) => p0.activities, 'activities', mockActivitiesSelected,
        // )
        // .having(
        //   (p0) => p0.status, 'status', ActivitiesStatus.success,
        // )
        // .having(
        //   (p0) => p0.subscriptionStatus, 'subscriptionStatus', SubscriptionStatus.initial,
        // ),
        // isA<ActivitiesState>()
        // .having(
        //   (p0) => p0.activities, 'activities', mockActivitiesSelected,
        // )
        // .having(
        //   (p0) => p0.status, 'status', ActivitiesStatus.success,
        // )
        // .having(
        //   (p0) => p0.subscriptionStatus, 'subscriptionStatus', SubscriptionStatus.success,
        // )
        // .having(
        //   (p0) => p0.message, 'message', TextConstant.addActivitySuccessfully,
        // ),
        
          
        //   isA<ActivitiesState>().

        //   activitiesList: mockActivitiesSelected,
        //   subscriptionStatus: SubscriptionStatus.initial,
        // ),
        // ActivitiesState(
        //   activities: mockActivitiesSelected,
        //   status: ActivitiesStatus.success,
        //   subscriptionStatus: SubscriptionStatus.success,
        //   message: TextConstant.addActivitySuccessfully,
        // )
      ]
    );

    // test('emits [ActivitiesState] when is added', () async {
    //   //  activitiesCubit = ActivitiesCubit(mockActivitiesRepository);
    //    activitiesCubit.addActivity(activity);
    //    expect(activitiesCubit.state.subscriptionStatus, SubscriptionStatus.success);
    // });

    // test('should call getAllActivities once', () {
    //   verify(() => mockActivitiesRepository.getAllActivities()).called(1);
    // });
    
    group('getAllActivities', () {


      // List<ActivitySelected> activities = [
      //      ActivitySelected(selected: false, activity: activity, hasMatches: false)
      // ];
    //  test('should increment length', () {
    //     expect(activitiesCubit.state.activities.length, equals(1));
    //  });

    //  test('should increment another length', () {

    //   activitiesCubit.addActivity(activity);

    //   expect(activitiesCubit.state.activities.length, equals(2));
    //  });



      //  blocTest<ActivitiesCubit, ActivitiesState>(
      //   'emits nothing when city is null',
      //   build: () => activitiesCubit,
      //   act: (cubit) => cubit.getAllActivities(),
      //   expect: () => <ActivitiesState>[
      //      ActivitiesState().copyWith(
      //                   status: ActivitiesStatus.success,

      //       activities: [
      //         ActivitySelected(activity: activity, selected: true, hasMatches: false)
      //       ],
      //                   subscriptionStatus: SubscriptionStatus.initial

      //      ),
      //      ActivitiesState().copyWith(
      //                   status: ActivitiesStatus.initial,

      //       activities: [
      //         ActivitySelected(activity: activity, selected: true, hasMatches: false)
      //       ],
      //                   subscriptionStatus: SubscriptionStatus.initial)
      //   ],
      // );
    });
  });
}