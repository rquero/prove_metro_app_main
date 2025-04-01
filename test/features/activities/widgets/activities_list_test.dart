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
  // Create the widget by telling the tester to build it.
    testWidgets('Activities list render', (tester) async {
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
          home: ActivitiesList(
            title: TextConstant.titleActvitiesList,
            activitiesList: mockActivities
          ),
        ),
      ));
    
      // Define the Finders
      final titleActivityListFinder = find.text(TextConstant.titleActvitiesList);
    
      // Check if the title is in the activity list widget tree
      expect(titleActivityListFinder, findsOneWidget);

      final listViewActivitiesListFinded = find.byKey(ValueKey(KeyConstant.activitiesListKey));
    
      // Check if the list view is in the widget tree
      expect(listViewActivitiesListFinded, findsOneWidget);

      final nameFinder = find.text(mockActivity.name);

      // Check if the title activity is in the activity list
      expect(nameFinder, findsOneWidget);

      final classHourFinder = find.text(mockActivity.classHour);

      // Check if the title activity is in the activity list
      expect(classHourFinder, findsOneWidget);
     
      final classDayFinder = find.text(mockActivity.classDay);

      // Check if the title activity is in the activity list
      expect(classDayFinder, findsOneWidget);

      final availableFinder = find.text(TextConstant.availableSchedule);

      // Check if the title activity is in the activity list
      expect(availableFinder, findsOneWidget);
      
      
    });
  });
}