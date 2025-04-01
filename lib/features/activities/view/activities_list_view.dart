import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';

import 'package:prove_metro_app_main/core/themes/app_styles.dart';
import 'package:prove_metro_app_main/features/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app_main/features/activities/widgets/widgets.dart';

class ActivitiesListView extends StatelessWidget {
  const ActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ActivitiesCubit, ActivitiesState>(
        listenWhen: (ActivitiesState previousState, ActivitiesState state) {
          return state.subscriptionStatus != SubscriptionStatus.initial;
        },
        listener: (BuildContext context, ActivitiesState state) {
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
        buildWhen: (ActivitiesState previousState, ActivitiesState state) {
          return state.status != ActivitiesStatus.initial
                || state.subscriptionStatus != SubscriptionStatus.initial;
        },
        builder: (BuildContext context, ActivitiesState state) {
          return switch ( state.status ) {
            ActivitiesStatus.loading || ActivitiesStatus.initial => ActivitiesListLoading(),
            ActivitiesStatus.failure => ActivitiesListFailure(),
            ActivitiesStatus.success => state.activities.isEmpty
              ? ActivitiesListEmpty()
              : ActivitiesList(
                  title: TextConstant.titleActvitiesList,
                  activitiesList: state.activities,
                ),
          };
        },
    ));
  }
}