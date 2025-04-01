
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/shared/models/activity.dart';
import 'package:prove_metro_app_main/shared/repository/activities_repository.dart';

part 'user_activities_state.dart';

class UserActivitiesCubit extends Cubit<UserActivitiesState> {
  final ActivitiesRepository _activitiesRepository;
  late final Stream<List<Activity>> _streamSubscription;

  UserActivitiesCubit(this._activitiesRepository) : super(UserActivitiesState()) {
    init();
  }

  void init() async {
    _streamSubscription = _activitiesRepository.getActivitiesUser();
    getActivitiesUser();
  }
  
  void getActivitiesUser() async {
    emit(state.copyWith(status: UserActivitiesStatus.initial));

    try {
      _streamSubscription.listen(
        (event) { 
          emit(state.copyWith(
            activitiesList: [...event],
            status: UserActivitiesStatus.success
          ));
        }
      );

    } catch (e) {
      emit(state.copyWith(status: UserActivitiesStatus.failure));
    }
    
  }

  void deleteActivity(Activity activity) async {
    try {
      await _activitiesRepository.removeActivity(activity);

      emit(
        state.copyWith(
          unsubscriptionStatus: UnsubscriptionStatus.success,
          message: TextConstant.deleteActivitySuccessfully,
        ));
    } catch(err) {
      emit(
        state.copyWith(
          unsubscriptionStatus: UnsubscriptionStatus.failure,
          message: TextConstant.deleteActivityFailure,
        ));
    }

    emit(state.copyWith(unsubscriptionStatus: UnsubscriptionStatus.initial));

  }

  // void deleteActivity(Activity activity) {
  //   print('delete activity');
  //   try {
  //     _activityUserService.removeActivity(activity);

  //     final activities = _activityUserService.getActivitiesList();

  //     emit(
  //       state.copyWith(
  //         status: ActivitiesListUserStatus.success,
  //         activitiesList: [...activities]
  //     ));
  //   } catch (err) {
  //     print('Error delete activity');
  //   }
  // }

}