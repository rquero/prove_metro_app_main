import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/features/user_activities/cubit/user_activities_cubit.dart';
import 'package:prove_metro_app_main/features/user_activities/widgets/widgets.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';
import 'package:prove_metro_app_main/shared/models/trainer.dart';

class MockActivitiesCubit extends MockCubit<ActivitiesState> implements ActivitiesCubit {}

class MockActiviesMemberCubit extends MockCubit<UserActivitiesState> implements UserActivitiesCubit {}

final mockActivity = Activity(
    id: 1,
    name: 'Padel',
    description: '',
    image: '/images/PADEL--300x119.jpg',
    responsibleTrainer: 1,
    registeredPartners: [],
    classDay: 'Lunes',
    classHour: '9:00',
    trainer: Trainer(
      id: 0,
      name: 'Juan',
      lastNames: 'Lopez, Sanchez',
      dni: '213213213',
      cv: '111111111',
      activities: [])
  );

final mockActivitySelected = ActivitySelected(
  selected: false,
  activity: mockActivity,
  hasMatches: false
);



final List<ActivitySelected> mockActivities = [mockActivitySelected];
    
void main() {
   group('Activities list member', () {
  // Create the widget by telling the tester to build it.
    testWidgets('Activities list member render', (tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<ActivitiesCubit>(
            create: (context) => MockActivitiesCubit()
          ),
          BlocProvider<UserActivitiesCubit>(
            create: (context) => MockActiviesMemberCubit(),
          )
        ],
        child: MaterialApp(
          home: UserActivitiesList(
            title: TextConstant.titleActivitiesListMember,
            activitiesList: [
              mockActivity
            ]
          ),
        ),
      ));
    
      // Define the Finders
      final titleActivityListMemberFinder = find.text(TextConstant.titleActivitiesListMember);
    
      // Check if the title is in the activity list widget tree
      expect(titleActivityListMemberFinder, findsOneWidget);

      // final listViewActivitiesListFinded = find.byKey(ValueKey(KeyConstant.activitiesListMemberKey));
    
      // // Check if the list view is in the widget tree
      // expect(listViewActivitiesListFinded, findsOneWidget);

      // final titleActivityItemFinder = find.text(mockActivity.name);

      // // Check if the title activity is in the activity list
      // expect(titleActivityItemFinder, findsOneWidget);

      // final hourActivityItemFinder = find.text(mockActivity.classHour);

      // // Check if the title activity is in the activity list
      // expect(hourActivityItemFinder, findsOneWidget);
     
      // final dayActivityItemFinder = find.text(mockActivity.classDay);

      // // Check if the title activity is in the activity list
      // expect(dayActivityItemFinder, findsOneWidget);

      // final textAvailableActivityItemFinder = find.text(TextConstant.availableSchedule);

      // // Check if the title activity is in the activity list
      // expect(textAvailableActivityItemFinder, findsOneWidget);

      // final trainerFullnameFinder = find.text(mockActivity.trainer!.fullName);
      
      // // Check if the title activity is in the activity list
      // expect(trainerFullnameFinder , findsOneWidget);


      
    });
  });
}