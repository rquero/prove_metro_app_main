import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/features/user_activities/cubit/user_activities_cubit.dart';
import 'package:prove_metro_app_main/features/user_activities/widgets/widgets.dart';

class UserActivitiesView extends StatelessWidget {
  const UserActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<UserActivitiesCubit, UserActivitiesState>(
        listenWhen: (UserActivitiesState previousState, UserActivitiesState state) {
          return state.unsubscriptionStatus != UnsubscriptionStatus.initial;
        },
        listener: (BuildContext context, UserActivitiesState state) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: AppStyle.txtPoppinsRegular14White
                ),
              ),
            );
        },
        builder: (BuildContext context, UserActivitiesState state) {
          return switch ( state.status ) {
            UserActivitiesStatus.initial || UserActivitiesStatus.loading => UserActivitiesListLoading(),
            UserActivitiesStatus.failure => UserActivitiesListFailure(),
            UserActivitiesStatus.success => state.activitiesList.isEmpty
              ? UserActivitiesListEmpty()
              : UserActivitiesList(
                title: TextConstant.titleActivitiesListMember,
                activitiesList: state.activitiesList
              )
          };
        },
      ));
  }
}
