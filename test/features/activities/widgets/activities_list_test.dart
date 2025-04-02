import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prove_metro_app_main/core/constants/key_constant.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/features/activities/widgets/activities_list.dart';
import 'package:prove_metro_app_main/features/user_activities/cubit/user_activities_cubit.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/models/activity_selected.dart';

import '../cubit/activities_cubit_test.dart';

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
    classHour: '9:00'
  );

final mockActivitySelected = ActivitySelected(
  selected: false,
  activity: mockActivity,
  hasMatches: false
);


final List<ActivitySelected> mockActivities = [mockActivitySelected];
    
void main() {

  group('Activities list', () {
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
            home: ActivitiesList(
              title: TextConstant.titleActvitiesList,
              activitiesList: mockActivities
            ),
          ),
        ));
    }

    testWidgets('Activities list render', (tester) async { 
      
      await loadActivitiesListWidget(tester);

      final textTitleFinded = find.text(TextConstant.titleActvitiesList);
      
      final listViewActivitiesListFinded = find.byKey(ValueKey(KeyConstant.activitiesListKey));
      
      final textNameFinded = find.text(mockActivity.name);
      
      final textClassHourFinded = find.text(mockActivity.classHour);
      
      final textClassDayFinded = find.text(mockActivity.classDay);
      
      final textAvailableFinded = find.text(TextConstant.availableSchedule);

      final buttonDetailFinded = find.byKey(ValueKey('${KeyConstant.activitiesListButtonDetailKey}_${activity.id}'));
      
      // Check if the text title is in the activity list widget tree
      expect(textTitleFinded, findsOneWidget);

      // Check if the list view is in the widget tree
      expect(listViewActivitiesListFinded, findsOneWidget);

      // Check if the text name is in the activity list
      expect(textNameFinded, findsOneWidget);

      // Check if the text class hour is in the activity list
      expect(textClassHourFinded, findsOneWidget);
     
      // Check if the text class day is in the activity list
      expect(textClassDayFinded, findsOneWidget);

      // Check if the text available is in the activity list
      expect(textAvailableFinded, findsOneWidget);
      
      expect(buttonDetailFinded, findsOneWidget);
    });
  });
}