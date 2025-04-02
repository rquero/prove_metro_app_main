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
import 'package:prove_metro_app_main/shared/widgets/widgets.dart';

import '../../features/activities/cubit/activities_cubit_test.dart';

class MockActivitiesCubit extends MockCubit<ActivitiesState> implements ActivitiesCubit {}

class MockActiviesMemberCubit extends MockCubit<UserActivitiesState> implements UserActivitiesCubit {}

final mockActivity = Activity(
  id: 1,
  name: 'Padel',
  description: 'Clase de Padel',
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
  hasMatches: true
);

final List<ActivitySelected> mockActivities = [mockActivitySelected];

void main() {
   group('Activity detail', () {
    
    loadActivityDetailWidget(WidgetTester tester, ActivitySelected activitySelected) async {
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
            home: ActivityDetail(
              activity: activitySelected.activity,
              titleButton: TextConstant.inscriptionActivityButton,
              hideButton: activitySelected.hasMatches,
           ),
          ),
        ));
    }

    testWidgets('Activity detail render', (tester) async {

      await loadActivityDetailWidget(tester, mockActivitySelected);
    
      final titleActivityFinded = find.text(mockActivity.name);

      final hourActivityFinded = find.text(mockActivity.classHour);

      final dayActivityFinded = find.text(mockActivity.classDay);

      final textAvailableActivityItemFinded = find.text(TextConstant.availableSchedule);

      final textDescriptionActivityFinded = find.text(mockActivity.description);

      final textTitleButtonActivityFinded = find.text(TextConstant.inscriptionActivityButton);

      // Check if the title is in the activity detail widget
      expect(titleActivityFinded, findsOneWidget);

      // Check if the hour activity is in the activity detail widget
      expect(hourActivityFinded, findsOneWidget);
     
      // Check if the day activity is in the activity detail widget
      expect(dayActivityFinded, findsOneWidget);

      // Check if the available activity is in the activity detail widget
      expect(textAvailableActivityItemFinded, findsOneWidget);

      // Check if the description activity is in the activity detail widget
      expect(textDescriptionActivityFinded, findsOneWidget);

      // Check if the button title is displayed
      expect(textTitleButtonActivityFinded, findsOneWidget);

    });

    testWidgets('Button is not displayed when the hide property is true', (tester) async {

      final mockActivitySelected = ActivitySelected(
        selected: false,
        activity: mockActivity,
        hasMatches: false
      );

      await loadActivityDetailWidget(tester, mockActivitySelected);

      final textTitleButtonActivityFinded = find.text(TextConstant.inscriptionActivityButton);

      expect(textTitleButtonActivityFinded, findsNothing);

    });
  });
}