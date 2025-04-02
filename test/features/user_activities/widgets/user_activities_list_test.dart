import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prove_metro_app_main/core/constants/key_constant.dart';

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
    activities: []
  )
);

final mockActivitySelected = ActivitySelected(
  selected: false,
  activity: mockActivity,
  hasMatches: false
);

final List<ActivitySelected> mockActivities = [mockActivitySelected];
    
void main() {
   group('Activities list member', () {
    
    loadActivitiesListWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
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
            ]),
          ),
        ));
    }

    testWidgets('Activities list member render', (tester) async {

      await loadActivitiesListWidget(tester);

      final titleActivityListMemberFinded = find.text(TextConstant.titleActivitiesListMember);
      
      final listViewActivitiesListFinded = find.byKey(ValueKey(KeyConstant.activitiesListMemberKey));

      final titleActivityItemFinded = find.text(mockActivity.name);

      final hourActivityItemFinded = find.text(mockActivity.classHour);

      final dayActivityItemFinded = find.text(mockActivity.classDay);

      final textAvailableActivityItemFinded = find.text(TextConstant.availableSchedule);

      final trainerFullnameFinded = find.text(mockActivity.trainer!.fullName);

      // Check if the title is in the activity list widget tree
      expect(titleActivityListMemberFinded, findsOneWidget);

      // Check if the list view is in the widget tree
      expect(listViewActivitiesListFinded, findsOneWidget);

      // Check if the title activity is in the activity list
      expect(titleActivityItemFinded, findsOneWidget);

      // Check if the hour activity is in the activity list
      expect(hourActivityItemFinded, findsOneWidget);
     
      // Check if the day activity is in the activity list
      expect(dayActivityItemFinded, findsOneWidget);

      // Check if the available activity is in the activity list
      expect(textAvailableActivityItemFinded, findsOneWidget);

      // Check if the trainer activity is in the activity list
      expect(trainerFullnameFinded , findsOneWidget);
    });
  });
}