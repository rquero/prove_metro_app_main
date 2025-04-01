import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app_main/core/constants/config_constant.dart';
import 'package:prove_metro_app_main/features/user_activities/cubit/user_activities_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:prove_metro_app_main/shared/repository/member_repository.dart';
import 'package:prove_metro_app_main/shared/services/member_service.dart';
import 'package:prove_metro_app_main/core/themes/app_theme.dart';
import 'package:prove_metro_app_main/shared/services/trainer_service.dart';
import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/features/home/view/home_page.dart';
import 'package:prove_metro_app_main/shared/repository/activities_repository.dart';
import 'package:prove_metro_app_main/shared/services/activity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final activityService = ActivityService(
    prefs: await SharedPreferences.getInstance()
  );

  runApp(
    MyApp(
      createActivitiesRepository: () => ActivitiesRepository(
        activityService: activityService,
        trainerService: TrainerService()
      )
    ));
}

class MyApp extends StatelessWidget {
  final ActivitiesRepository Function() createActivitiesRepository;

  const MyApp({super.key, required this.createActivitiesRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => createActivitiesRepository(),
          dispose: (repository) => repository.dispose(),

        ),
        RepositoryProvider(
          create: (_) => MemberRepository(
            memberService: MemberService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ActivitiesCubit(context.read<ActivitiesRepository>())
          ),
          BlocProvider(
            create: (context) => UserActivitiesCubit(context.read<ActivitiesRepository>()),
          )
        ],
        child: MaterialApp(
          title: ConfigConstant.titleApp,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: AppTheme.dark,
        ),
      ),
    );
  }
}
